#!/usr/bin/env bash
set -euo pipefail

# Determine script directory reliably
basedir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
initfile="${basedir}/init-packages.el"

# Ensure Emacs is installed
if ! command -v emacs >/dev/null 2>&1; then
  echo "Error: emacs is not installed or not in PATH." >&2
  exit 1
fi

# Ensure the Elisp script exists
if [[ ! -f "${initfile}" ]]; then
  echo "Error: ${initfile} not found." >&2
  exit 1
fi

# Run Emacs in batch mode to execute the Elisp bootstrap script
cd "${basedir}"
emacs -Q --batch -l "${initfile}"

