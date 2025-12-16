#!/usr/bin/env sh
set -eu

echo "[esphome-visual-editor] Starting..."

OPTIONS_FILE="/data/options.json"

export_options() {
  echo "[esphome-visual-editor] Exporting options from $OPTIONS_FILE" >&2

  python - <<'PY'
import json
import os
import shlex
import sys

path = "/data/options.json"
allow = {"projects_dir"}  # extend if you add more options

try:
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
except Exception as e:
    print(f"[esphome-visual-editor] Failed to read {path}: {e}", file=sys.stderr)
    sys.exit(0)

for key in sorted(allow):
    if key not in data:
        continue
    val = data[key]
    if val is None:
        continue
    # Emit in a shell-friendly way: KEY='value'
    print(f"export {key}={shlex.quote(str(val))}")
PY
}

eval "$(export_options)"

export PROJECTS_DIR="${projects_dir:-${PROJECTS_DIR:-/data/projects}}"
export PORT="${PORT:-6056}"

echo "[esphome-visual-editor] HOST=${HOST} PORT=${PORT} projects_dir=${projects_dir:-} PROJECTS_DIR=${PROJECTS_DIR}"

mkdir -p "$PROJECTS_DIR" || true

exec python -m eve_schema_service


