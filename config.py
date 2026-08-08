import argparse
import json
import os
import shutil
import stat
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

# Anchored to the script location (like linkutils.py), so the tool works
# regardless of the current working directory.
BASE_DIR = Path(__file__).resolve().parent
BASE_TMP_DIR = BASE_DIR / "tmp"
CONFIG_PATH = BASE_DIR / "config.json"


def get_target_path(item_name: str) -> Path:
	return BASE_TMP_DIR / item_name


def run_cmd(cmd: List[str], cwd: Optional[Path] = None, capture_output: bool = False) -> subprocess.CompletedProcess:
	"""Helper to run shell commands safely."""
	print(f"Running: {' '.join(cmd)}")
	return subprocess.run(
		cmd,
		cwd=cwd,
		check=True,
		capture_output=capture_output,
		text=True,
	)


def get_item_config(item: Dict[str, Any]) -> Dict[str, Any]:
	"""Applies default configuration values to an item."""
	link = item.get("link", "")
	if "name" not in item:
		item["name"] = os.path.basename(link)

	item.setdefault("result", "folder")
	item.setdefault("type", "git")
	item.setdefault("branch", "trunk")
	return item


def get_git_commit(repo_path: Path) -> str:
	"""Retrieves the current HEAD commit hash."""
	result = run_cmd(["git", "-C", str(repo_path), "rev-parse", "HEAD"], capture_output=True)
	return result.stdout.strip()


def update_item_commit(item: Dict[str, Any]) -> None:
	"""Updates the commit field for git repositories."""
	if item.get("type") != "git":
		return
	target_path = get_target_path(item["name"])
	if not target_path.exists():
		return
	commit = get_git_commit(target_path)
	item["commit"] = commit
	print(f"Updated commit for {item['name']}: {commit}")


def action_create(item: Dict[str, Any]) -> None:
	"""Clones a repository or routes to update."""
	target_path = get_target_path(item["name"])
	if target_path.exists():
		print(f"Item {item['name']} already exists, routing to update...")
		action_update(item)
		return

	print(f"Creating {item['name']}...")
	run_cmd([
		"git", "clone",
		"--branch", item["branch"],
		"--depth", "1",
		"--single-branch",
		item["link"],
		str(target_path),
	])

	# Handle specific commit if provided
	if item.get("commit"):
		print(f"Checking out commit: {item['commit']}")
		try:
			run_cmd(["git", "checkout", item["commit"]], cwd=target_path)
		except subprocess.CalledProcessError:
			print(f"Commit {item['commit']} not found locally, fetching...")
			try:
				run_cmd(["git", "fetch", "--depth", "1", "origin", item["commit"]], cwd=target_path)
				run_cmd(["git", "checkout", item["commit"]], cwd=target_path)
			except subprocess.CalledProcessError:
				print(f"Warning: Failed to checkout commit {item['commit']}. Defaulting to latest.")

	update_item_commit(item)
	copy_skills(item)


def action_update(item: Dict[str, Any]) -> None:
	"""Updates an existing repository to the latest state of its branch.

	Shallow clones cannot be merged: ``git pull`` on a repo fetched with
	``--depth 1`` fails with "refusing to merge unrelated histories" once the
	remote moves past the last fetch. Instead, the working tree is hard-reset
	to the fetched branch tip. These are read-only source snapshots, so any
	local changes are discarded by design. Note: after a commit-pinned create
	the repo is on a detached HEAD; reset keeps it detached (the local branch
	ref goes stale), which is harmless because every update resets from
	``origin/<branch>``.
	"""
	target_path = get_target_path(item["name"])
	if not target_path.exists():
		print(f"Item {item['name']} does not exist, routing to create...")
		action_create(item)
		return

	print(f"Updating {item['name']}...")
	run_cmd(["git", "fetch", "--depth", "1", "origin", item["branch"]], cwd=target_path)
	run_cmd(["git", "reset", "--hard", f"origin/{item['branch']}"], cwd=target_path)
	update_item_commit(item)
	copy_skills(item)


def copy_skills(item: Dict[str, Any]) -> None:
	"""Copies an agent's skills from its tmp clone into the project.

	Each entry in ``item["skills"]`` maps ``input`` (a path inside the tmp
	clone) to ``output`` (a path in the project, relative to the script
	location). The output is made to mirror the input: any existing file or
	directory at the output is replaced, so updates refresh the installed
	copy (stale files are removed).
	"""
	skills = item.get("skills")
	if not skills:
		return

	repo_path = get_target_path(item["name"])
	for skill in skills:
		input_rel = skill.get("input", "")
		output_rel = skill.get("output", "")
		if not input_rel or not output_rel:
			raise ValueError(f"Skill entry missing 'input' or 'output': {skill}")

		src = repo_path / input_rel
		dst = BASE_DIR / output_rel

		# Safety: refuse empty/overlapping paths. An empty output would wipe the
		# project root, and paths overlapping the tmp clone would delete the source.
		if dst == BASE_DIR or dst == src or dst.is_relative_to(src) or src.is_relative_to(dst):
			raise ValueError(f"Refusing to copy {src} -> {dst}: paths overlap or target the project root")

		if not src.exists():
			raise FileNotFoundError(f"Skill input not found: {src}")

		dst.parent.mkdir(parents=True, exist_ok=True)
		if dst.is_symlink() or dst.is_file():
			dst.unlink()
		elif dst.is_dir():
			_force_rmtree(dst)

		if src.is_dir():
			shutil.copytree(src, dst)
		else:
			shutil.copy2(src, dst)
		print(f"Copied {src} -> {dst}")


def _force_rmtree(path: Path) -> None:
	"""rmtree that survives Windows read-only files.

	Git marks its pack and loose object files read-only, and on Windows
	``shutil.rmtree`` fails with [WinError 5] on read-only files. Clear the
	attribute and retry on each failure.
	"""
	def _clear_and_retry(func, p, exc_info):
		os.chmod(p, stat.S_IWRITE)
		func(p)

	# The handler ignores its third argument, so it works for both onexc (py3.12+)
	# and the deprecated onerror callback.
	if sys.version_info >= (3, 12):
		shutil.rmtree(path, onexc=_clear_and_retry)
	else:
		shutil.rmtree(path, onerror=_clear_and_retry)


def action_delete(item: Dict[str, Any]) -> None:
	"""Deletes a repository folder."""
	target_path = get_target_path(item["name"])
	if not target_path.exists():
		print(f"Skipping delete for {item['name']}, not found.")
		return

	print(f"Deleting {item['name']}...")
	_force_rmtree(target_path)


def load_config() -> Dict[str, Any]:
	"""Loads config.json anchored to the script location."""
	with open(CONFIG_PATH, "r", encoding="utf-8") as f:
		return json.load(f)


def save_config(data: Dict[str, Any]) -> None:
	"""Atomically writes config.json (temp file + rename), UTF-8, tab-indented."""
	fd, tmp_path = tempfile.mkstemp(dir=CONFIG_PATH.parent, suffix=".tmp")
	try:
		with os.fdopen(fd, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t")
		os.replace(tmp_path, CONFIG_PATH)
	except BaseException:
		try:
			os.unlink(tmp_path)
		except OSError:
			pass
		raise


def main() -> None:
	parser = argparse.ArgumentParser(description="CLI Tool for managing project configurations defined in config.json")
	parser.add_argument("action", choices=["create", "update", "delete"], help="Action to perform")
	parser.add_argument("--target", choices=["sources", "agents"], help="Filter by sources or agents")

	if len(sys.argv) == 1:
		parser.print_help()
		sys.exit(0)

	args = parser.parse_args()

	data = load_config()

	# Filter items
	to_process: List[Dict[str, Any]] = []
	if args.target in ["sources", None]:
		to_process.extend(get_item_config(item) for item in data.get("sources", []))
	if args.target in ["agents", None]:
		to_process.extend(get_item_config(item) for item in data.get("agents", []))

	# Execute with per-item error isolation: one failure must not abort the rest.
	actions = {
		"create": action_create,
		"update": action_update,
		"delete": action_delete,
	}

	failures: List[Tuple[str, Exception]] = []
	for item in to_process:
		try:
			actions[args.action](item)
		except (subprocess.CalledProcessError, OSError, ValueError) as exc:
			name = item.get("name", "<unknown>")
			print(f"ERROR: {name}: {exc}", file=sys.stderr)
			failures.append((name, exc))

	# Persist changes (successful updates are still saved even if some items failed)
	if args.action in ["create", "update"]:
		save_config(data)
		print("config.json updated with new commit hashes.")

	if failures:
		print(f"\n{len(failures)} item(s) failed:", file=sys.stderr)
		for name, exc in failures:
			print(f"  - {name}: {exc}", file=sys.stderr)
		sys.exit(1)


if __name__ == "__main__":
	main()
