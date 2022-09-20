# Personal dotfiles

## Installing

You will need `git` and GNU `stow`.

Clone into your `$HOME` directory or `~`.

```bash
git clone https://github.com/gonzus/dotfiles ~
```

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README and LICENSE files)
```

```bash
stow zsh # Just my zsh config
