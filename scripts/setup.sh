#!/usr/bin/env bash
# Trellis dev environment setup (Phase 0 placeholder).
#
# Nothing is implemented yet, so this just verifies prerequisites and gives
# next steps. Update this script as apps/packages gain real build tooling.
set -euo pipefail

echo "Trellis setup check"
echo "--------------------"

check() {
  local name="$1" cmd="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "[ok]   $name ($(command -v "$cmd"))"
  else
    echo "[miss] $name — install before Phase 1 work begins"
  fi
}

check "Node.js" node
check "pnpm" pnpm
check "git" git

cat << 'EOF'

Next steps (see docs/public/roadmap.md):
  - Phase 0: finalize tech-stack decisions in requirements/tech-stack.md
  - Phase 1: scaffold apps/ide-shell as an Electron app, wire up
    monaco-editor + xterm.js + node-pty per requirements/tech-stack.md

This repository currently contains planning/structure only — there is no
buildable app yet.
EOF
