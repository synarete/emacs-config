#!/bin/bash
set -e
selfd="$(dirname "$(basename "${BASH_SOURCE[0]}")")"
emacsd="${HOME}/.emacs.d/"

mkdir -p "${emacsd}"
install -m 400 "${selfd}/start.el" "${emacsd}"
install -m 400 "${selfd}/packages.el" "${emacsd}"
install -m 400 "${selfd}/config.el" "${emacsd}"
install -m 400 "${selfd}/keybind.el" "${emacsd}"
install -m 400 "${selfd}/appearance.el" "${emacsd}"
install -m 600 "${selfd}/init.el" "${emacsd}"
