# Personal dotfiles

## Installing

You will need [git](https://git-scm.com/) and [GNU
stow](https://www.gnu.org/software/stow/).

Clone this repo anywhere; it is recommended that you clone it into your home
directory (see below for the reasons):

```bash
git clone https://github.com/gonzus/dotfiles ~
```

## Using

Change your working directory to the directory you just cloned. If your clone
hangs directly from your home directory, you can run `stow` to symlink
everything; you can also select what you want to clone:

```bash
stow */  # symlink everything (the '/' ignores the README and LICENSE files)
stow zsh # symlink only the zsh config
```

If you cloned the repo somewhere else, you will have to use `stow`'s `--target`
(and possibly `--source`) options accordingly.
