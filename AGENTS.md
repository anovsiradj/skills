# Agent Development & Skill Guidelines

This document outlines the mandatory rules and standards for creating and maintaining agent skills in this workspace.

## 1. Language Standard
- **Language:** All skills, metadata, documentation, and prompt specifications **must always** be written in English (`en-us`).
- **Reasoning:** Ensures universal compatibility and consistent parsing across all LLM agents.

## 2. Versioning Standard
- **Format:** Versioning uses SemVer (Semantic Versioning) format (`MAJOR.MINOR.PATCH+BUILD`), but mapped directly to date-based components:
	- `MAJOR` = Year (`Y`, 4 digits)
	- `MINOR` = Month (`m`, 2 digits, leading zero)
	- `PATCH` = Day (`d`, 2 digits, leading zero)
	- `BUILD` (Metadata) = Hour (`H`, 2 digits, leading zero, prefixed with `+`)
- **Syntax:** `Y.m.d+H`
- **Leading Zeros:** Month (`m`), Day (`d`), and Hour (`H`) components must always use exactly 2 characters with leading zeros.
- **Examples:**
	- August 3, 2026, at 09:00 -> `2026.08.03+09`
	- December 25, 2026, at 14:00 -> `2026.12.25+14`
	- January 1, 2027, at 00:00 -> `2027.01.01+00`

## 3. Frontmatter Specification
All skill Markdown files must contain a YAML frontmatter block that complies with the [agentskills.io/specification](https://agentskills.io/specification).

Default Template:
```yaml
---
name: ...
description: ...
license: Unlicense
metadata:
  version: ...
  authors:
    - anovsiradj
---
```
