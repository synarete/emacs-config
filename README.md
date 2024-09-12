# Synarete's emacs configuration files

Clone the repository into new `~/.emacs.d`:

```sh
  $ mkdir ~/.emacs.d
  $ git clone https://github.com/synarete/emacs-config ~/.emacs.d
  ...
```

Execute packages installation script (may take some time):

```sh
  $ ~/.emacs.d/emacs-install-packages.sh
  ...
```

Run emacs and add few extra packages manually:

```sh
  $ emacs
  ...
  M-x package-initialize
  M-x package-refresh-contents
  M-x package-install RET treemacs-projectile
  M-x package-install RET lsp-mode
  M-x package-install RET lsp-ui
  ...
```

