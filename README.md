# Dotfiles

Personal Linux configuration files, organized as GNU Stow packages. Stow creates
symlinks from a package in this repository into your home directory (or, for a
small number of system packages, into `/`). The files stay version-controlled
here; edit them in the repository and the linked configuration updates in place.

## Requirements

- Git
- GNU Stow
- The applications used by the configuration you choose (for example Sway,
  Kitty, Fish, or Neovim)

The package notes are Arch-oriented. On Arch Linux, Git and Stow can be
installed with:

```sh
sudo pacman -S --needed git stow
```

## Repository layout

| Path | Contents |
| --- | --- |
| `shared/` | General-purpose home-directory packages: Bash, Fastfetch, Fish, Foot, Kitty, Neovim, scripts, tmux, and Zsh. |
| `profiles/sw_dms/` | Sway, Fish, Kitty, Matugen, and environment configuration for the `sw_dms` setup. |
| `profiles/sw_holo/` | Sway, Fish, Kitty, Fastfetch, Rofi, and helper scripts for the `sw_holo` setup. |
| `profiles/sw_min/` | Sway, Kitty, and i3status-rust configuration for the `sw_min` setup. |
| `onroot/` | System-targeted packages: an `initd` helper under `/usr/local/bin` and SDDM configuration/theme files. |
| `deps/` | Manually maintained package/dependency notes; these are not an installer input. |

Each immediate subdirectory of `shared/`, a profile directory, or `onroot/` is
a Stow package. The directory layout inside a package mirrors its destination:
for example, `shared/nvim/.config/nvim/init.lua` links to
`~/.config/nvim/init.lua`.

## Install home-directory configuration

Clone the repository and change into it:

```sh
git clone https://github.com/javoxir-sv/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Back up any existing configuration files that overlap with the packages you
intend to install. Stow will report conflicts rather than overwrite unrelated
files.

First preview and then install a useful shared baseline:

```sh
stow --simulate --verbose --dir="$HOME/.dotfiles/shared" --target="$HOME" \
  bash foot nvim scripts tmux zsh

stow --dir="$HOME/.dotfiles/shared" --target="$HOME" \
  bash foot nvim scripts tmux zsh
```

Choose **one** profile and preview/install its packages. For example, to use
`sw_holo`:

```sh
stow --simulate --verbose --dir="$HOME/.dotfiles/profiles/sw_holo" --target="$HOME" \
  fastfetch fish kitty rofi scripts sway

stow --dir="$HOME/.dotfiles/profiles/sw_holo" --target="$HOME" \
  fastfetch fish kitty rofi scripts sway
```

For the other profiles, use their package names instead:

```sh
# sw_dms
stow --simulate --verbose --dir="$HOME/.dotfiles/profiles/sw_dms" --target="$HOME" \
  environment.d fish kitty matugen sway
stow --dir="$HOME/.dotfiles/profiles/sw_dms" --target="$HOME" \
  environment.d fish kitty matugen sway

# sw_min
stow --simulate --verbose --dir="$HOME/.dotfiles/profiles/sw_min" --target="$HOME" \
  i3status-rust kitty sway
stow --dir="$HOME/.dotfiles/profiles/sw_min" --target="$HOME" \
  i3status-rust kitty sway
```

The `shared/` packages `fish`, `kitty`, and `fastfetch` overlap with profile
packages of the same names. Use the profile version when that profile provides
one; do not Stow both versions of the same destination. For example,
`sw_min` does not provide Fish or Fastfetch, so you can add the shared versions
if you want them:

```sh
stow --dir="$HOME/.dotfiles/shared" --target="$HOME" fish fastfetch
```

Packages can also be installed or removed individually. To unlink a package,
use the same Stow directory, target, and package name with `--delete`:

```sh
stow --delete --dir="$HOME/.dotfiles/profiles/sw_holo" --target="$HOME" \
  fastfetch fish kitty rofi scripts sway
```

Stow only removes links it manages. Review a simulation before changing a
machine, especially if the target already contains files or directories.

## System packages

`onroot/` contains packages that target system paths. These require elevated
permissions and affect login/system behavior. Preview the operation, inspect
the planned links, and only then apply it:

```sh
sudo stow --simulate --verbose --dir="$HOME/.dotfiles/onroot" --target=/ sddm
sudo stow --dir="$HOME/.dotfiles/onroot" --target=/ sddm
```

The `sddm` package installs the SDDM Wayland settings and the `pixelcyber`
theme. The `init` package provides `/usr/local/bin/initd`:

```sh
sudo stow --simulate --verbose --dir="$HOME/.dotfiles/onroot" --target=/ init
sudo stow --dir="$HOME/.dotfiles/onroot" --target=/ init
```

`initd` is a compositor/profile launcher with the form `initd <compositor>
[profile]` (for example, `initd sway sw_holo`). **Use caution:** the helper
currently runs `rm -rf ~/.config/<package>` for each package in the selected
profile before Stowing it. This can permanently remove existing configuration
files in those directories. Back them up and inspect the helper before running
it; the manual Stow commands above are safer for managing links.

## Profile notes

- `sw_dms` includes an environment snippet, Matugen templates, and a Sway
  configuration that includes `~/.config/sway/noctalia`. That included file
  is not provided by this repository, so supply it separately or adjust the
  include before using this Sway configuration.
- `sw_holo` includes Rofi and i3blocks scripts alongside its Sway, Kitty,
  Fish, and Fastfetch settings.
- `sw_min` includes i3status-rust configuration and a wallpaper asset with its
  Sway and Kitty settings.

Stowing configuration does not install the applications it configures. Review
`deps/aur.txt`, `deps/pac.txt`, and `shared/nvim/.config/nvim/dep.txt` and
install only the dependencies you need. These are notes rather than a
validated, automated package manifest.

## Submodule note

The tmux plugins and Oh My Zsh are recorded as Git submodules. This checkout
does not contain a `.gitmodules` file, so Git cannot initialize those
submodules through the usual `git submodule update --init --recursive` command.
The corresponding directories are populated in this working tree, but a fresh
clone may not contain their contents. Check that they are present before
Stowing the `tmux` or `zsh` packages.

## Credits

The `sw_min` Sway profile includes the Broken Bun image; its source is
[osu! contest assets](https://assets.ppy.sh/contests/260/winners/broken-bun.png).
