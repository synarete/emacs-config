#!/usr/bin/env bash
set -e
basedir=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
initfile="${basedir}/init-packages.el"
command -v emacs
cd "${basedir}"
emacs -nw -Q --script "${initfile}"
