# Synarete's emacs configuration files

Clone the repository into new `~/.emacs.d` and install packages via script:

```sh
  $ mkdir ~/.emacs.d
  $ git clone https://github.com/synarete/emacs-config ~/.emacs.d
  $ ~/.emacs.d/emacs-install-packages.sh
  ...
```

Run emacs for first time and add few packages manually:

```sh
  $ emacs
  ...
  M-x package-initialize
  M-x package-refresh-contents
  M-x package-install RET projectile
  M-x package-install RET treemacs-projectile
  M-x package-install RET lsp-mode
  ...
```

