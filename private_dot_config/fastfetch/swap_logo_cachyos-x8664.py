#!/usr/bin/env python3
import sys
import json
import csv
import argparse
from pathlib import Path
from typing import List, Dict, Any, Optional


# -----------------------------
# Data Loading
# -----------------------------

def load_manifest(path: Path) -> List[Dict[str, Any]]:
    with path.open() as f:
        reader = csv.DictReader(f)
        return [
            {
                "source": row.get("source", "").strip(),
                "colors": row.get("colors", "").split("|") if row.get("colors") else []
            }
            for row in reader
        ]


def load_config(path: Path) -> Dict[str, Any]:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as e:
        print(f"Invalid JSON in {path}: {e}", file=sys.stderr)
        sys.exit(1)


# -----------------------------
# Logo Rotation
# -----------------------------

def rotate_logo(current: str, images: List[Dict[str, Any]]) -> str:
    names = [img["source"] for img in images]
    if current not in names:
        return current
    idx = names.index(current)
    return names[(idx + 1) % len(names)]


def find_entry(name: str, images: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
    for entry in images:
        if entry["source"] == name:
            return entry
    return None


# -----------------------------
# Color Application
# -----------------------------

def group_by_headers(modules: List[Any]) -> List[tuple[int, int]]:
    headers = [i for i, m in enumerate(modules) if isinstance(m, dict) and m.get("header")]
    if not headers:
        return [(0, len(modules))]

    groups = []
    for i, h in enumerate(headers):
        start = h + 1
        end = headers[i + 1] if i + 1 < len(headers) else len(modules)
        groups.append((start, end))
    return groups


def apply_colors(modules: List[Any], colors: List[str]) -> None:
    if not colors:
        return

    groups = group_by_headers(modules)
    for i, (start, end) in enumerate(groups):
        color = colors[i % len(colors)]
        for m in modules[start:end]:
            if isinstance(m, dict) and "keyColor" in m:
                m["keyColor"] = color


# -----------------------------
# Main Pipeline
# -----------------------------

def parse_args():
    p = argparse.ArgumentParser(description="Rotate fastfetch logo + apply colors")
    p.add_argument("--config", required=True, type=Path)
    p.add_argument("--manifest", required=True, type=Path)
    return p.parse_args()


def main():
    args = parse_args()

    data = load_config(args.config)
    images = load_manifest(args.manifest)

    # Rotate logo
    logo = data.get("logo", {})
    current_src = Path(logo.get("source", "")).name
    new_src = rotate_logo(current_src, images)
    logo["source"] = new_src

    # Determine colors
    entry = find_entry(new_src, images) or (images[0] if images else {})
    colors = entry.get("colors", [])

    # Apply colors
    modules = data.get("modules")
    if not isinstance(modules, list):
        print("Config missing modules list.", file=sys.stderr)
        sys.exit(1)

    apply_colors(modules, colors)

    # Save
    args.config.write_text(json.dumps(data, indent=2, ensure_ascii=False), encoding="utf-8")
    print(f"Updated config: logo={new_src}, colors={colors}, file={args.config}")


if __name__ == "__main__":
    main()


