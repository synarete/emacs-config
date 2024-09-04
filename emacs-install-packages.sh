#!/usr/bin/env bash
set -e
basedir=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
initfile="${basedir}/init.el"
command -v emacs
emacs -nw -Q --script "${initfile}"
