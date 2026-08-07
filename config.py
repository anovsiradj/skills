import json
import os
import subprocess
import argparse
import shutil
import sys
from pathlib import Path
from typing import Dict, Any, List

BASE_TMP_DIR = Path("tmp")

def get_target_path(item_name: str) -> Path:
    return BASE_TMP_DIR / item_name

def run_cmd(cmd: List[str], cwd: Path = None, capture_output: bool = False) -> subprocess.CompletedProcess:
    """Helper to run shell commands safely."""
    print(f"Running: {' '.join(cmd)}")
    return subprocess.run(
        cmd, 
        cwd=cwd, 
        check=True, 
        capture_output=capture_output, 
        text=True
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

def update_item_commit(item: Dict[str, Any]):
    """Updates the commit field for git repositories."""
    if item.get("type") == "git":
        target_path = get_target_path(item['name'])
        if target_path.exists():
            commit = get_git_commit(target_path)
            item['commit'] = commit
            print(f"Updated commit for {item['name']}: {commit}")

def action_create(item: Dict[str, Any]):
    """Clones a repository or routes to update."""
    target_path = get_target_path(item['name'])
    if target_path.exists():
        print(f"Item {item['name']} already exists, routing to update...")
        action_update(item)
        return

    print(f"Creating {item['name']}...")
    run_cmd([
        "git", "clone", 
        "--branch", item['branch'], 
        "--depth", "1", 
        "--single-branch", 
        item['link'], 
        str(target_path)
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

def action_update(item: Dict[str, Any]):
    """Updates an existing repository."""
    target_path = get_target_path(item['name'])
    if not target_path.exists():
        print(f"Item {item['name']} does not exist, routing to create...")
        action_create(item)
        return

    print(f"Updating {item['name']}...")
    run_cmd(["git", "fetch", "--depth", "1", "origin", item['branch']], cwd=target_path)
    run_cmd(["git", "pull", "origin", item['branch']], cwd=target_path)
    update_item_commit(item)

def action_delete(item: Dict[str, Any]):
    """Deletes a repository folder."""
    target_path = get_target_path(item['name'])
    if not target_path.exists():
        print(f"Skipping delete for {item['name']}, not found.")
        return

    print(f"Deleting {item['name']}...")
    shutil.rmtree(target_path)

def main():
    parser = argparse.ArgumentParser(description="CLI Tool for managing project configurations defined in config.json")
    parser.add_argument("action", choices=["create", "update", "delete"], help="Action to perform")
    parser.add_argument("--target", choices=["sources", "others"], help="Filter by sources or others")
    
    if len(sys.argv) == 1:
        parser.print_help()
        sys.exit(0)
        
    args = parser.parse_args()

    # Load config.json
    with open("config.json", "r") as f:
        data = json.load(f)

    # Filter items
    to_process = []
    if args.target in ["sources", None]:
        for item in data.get("sources", []):
            to_process.append(get_item_config(item))
    if args.target in ["others", None]:
        for item in data.get("others", []):
            to_process.append(get_item_config(item))

    # Execute
    actions = {
        "create": action_create,
        "update": action_update,
        "delete": action_delete
    }
    
    for item in to_process:
        actions[args.action](item)

    # Persist changes
    if args.action in ["create", "update"]:
        with open("config.json", "w") as f:
            json.dump(data, f, indent=4)
        print("config.json updated with new commit hashes.")

if __name__ == "__main__":
    main()
