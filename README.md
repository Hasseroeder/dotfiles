# Dotfiles managed by Chezmoi
Initiate on a new system with:
```zsh
chezmoi init --apply git@github.com:Hasseroeder/dotfiles.git
```

Or clone with:
```zsh
git clone https://github.com/Hasseroeder/dotfiles.git
```

### Pacman: 
Base:
```bash
sudo pacman -Syu --needed \
  git chezmoi zsh curl ca-certificates \
  fzf zoxide fastfetch neovim eza tree bat nethack nudoku \
  yazi xdg-utils mediainfo perl-image-exiftool imagemagick p7zip jq ripgrep fd \
  gawk coreutils python
```
Bspwm/Sxhkd Stack:
```bash
sudo pacman -Syu --needed \
  xorg-server xorg-xinit xorg-xrdb xorg-xsetroot xorg-setxkbmap \
  bspwm sxhkd polybar feh rofi iproute2 grep  
```

### Apt:
Base:
```bash
sudo apt update
sudo apt install -y \
  git zsh curl ca-certificates \
  fzf zoxide fastfetch neovim eza tree bat nethack-console nudoku \
  yazi xdg-utils mediainfo libimage-exiftool-perl imagemagick p7zip-full jq ripgrep fd-find \
  gawk coreutils python3
```
Bspwm/Sxhkd Stack:
```bash
sudo apt update
sudo apt install -y \
  xorg xinit x11-xserver-utils x11-xkb-utils \
  bspwm sxhkd polybar feh rofi iproute2 grep
```

### Additional Programs
NVM:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```
Zinit:
```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```
Powerlevel10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.powerlevel10k"
```
OhMyZsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Machines
I currently have 5 machines configured with this, and a few others in the works.

<h3 style="margin-bottom:-1rem">Online</h3>
<ul>
	<li>
		cachyos-x8664 - my main desktop computer
	</li>
	<li style="list-style:none">
		<img src="Screenshots/cachyos-x8664.png" style="width:50%">
	</li>
	<li>
		elitebook - an HP Elitebook 6930p
	</li>
	<li style="list-style:none">
		Image
	</li>
	<li>
		x200 - a Lenovo Thinkpad x200
	</li>
	<li style="list-style:none">
		Image
	</li>
	<li>
		antix1 - a little piece of shit i386 SBC that I rescued
	</li>
	<li style="list-style:none">
		<img src="Screenshots/antix1.png" style="width:50%">
	</li>
	<li>
		pi1 - which I use to host syncthing
	</li>
	<li style="list-style:none">
		Image
	</li>
</ul>

<h3 style="margin-bottom:-1rem">Not Yet Online</h3>

- my old computer currently sitting in my closet
- my mom's old computer currently sitting in the garage
- a spare raspberry pi
- a spare i386 SBC that is just as big a piece of shit as antix1

## Packages
### Required
| Program | Repository |
| --- | --- |
| Git | [git/git](https://github.com/git/git) |
| chezmoi | [twpayne/chezmoi](https://github.com/twpayne/chezmoi) |
| Zsh | [zsh-users/zsh](https://github.com/zsh-users/zsh) |
| Oh My Zsh | [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) |
| Powerlevel10k | [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| Zinit | [zdharma-continuum/zinit](https://github.com/zdharma-continuum/zinit) |

### Optional shell and terminal enhancements

These programs are guarded with `command -v`, file-existence checks, or directory checks. The dotfiles continue to work without them.

| Program| Repository |
| --- | --- |
| fzf | [junegunn/fzf](https://github.com/junegunn/fzf) |
| nvm | [nvm-sh/nvm](https://github.com/nvm-sh/nvm) |
| zoxide | [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) |
| fastfetch | [fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| Neovim | [neovim/neovim](https://github.com/neovim/neovim) |
| eza | [eza-community/eza](https://github.com/eza-community/eza) |
| tree | [Old-Man-Programmer/tree](https://github.com/Old-Man-Programmer/tree) |
| bat / batcat | [sharkdp/bat](https://github.com/sharkdp/bat) |
| nudoku | [jubalh/nudoku](https://github.com/jubalh/nudoku) |
| NetHack | [NetHack/NetHack](https://github.com/NetHack/NetHack) |

### Optional fastfetch support tools

`fastfetch` itself is optional, but when it is installed these configs expect the usual Unix tools below for custom command modules and the CachyOS logo swap helper.

| Program | | Repository |
| --- | --- | --- |
| GNU awk | `disk.sh` uses `awk` with `strtonum`| [mitchcapper/gawk](https://github.com/mitchcapper/gawk) |
| GNU coreutils | `df` and `date` used by the fastfetch scripts | [coreutils/coreutils](https://github.com/coreutils/coreutils) |
| Python 3 | Runs `swap_logo_cachyos-x8664.py` on `cachyos-x8664` | [python/cpython](https://github.com/python/cpython) |

### Optional Yazi file-manager stack

The `.chezmoiignore` skips the Yazi config when `yazi` is not installed. If you install Yazi, the config can also use these helper programs for previews and openers.

| Program | | Repository / upstream |
| --- | --- | --- |
| Yazi | Terminal file manager configured under `private_dot_config/yazi/`. | [sxyazi/yazi](https://github.com/sxyazi/yazi) |
| xdg-utils | `xdg-open` open/reveal actions on Linux. | [freedesktop/xdg-utils](https://gitlab.freedesktop.org/xdg/xdg-utils) |
| MediaInfo | Media metadata action. | [MediaArea/MediaInfo](https://github.com/MediaArea/MediaInfo) |
| ExifTool | EXIF metadata action. | [exiftool/exiftool](https://github.com/exiftool/exiftool) |
| ImageMagick | Yazi `magick` image spotter/previewer for AVIF/HEIF/JXL. | [ImageMagick/ImageMagick](https://github.com/ImageMagick/ImageMagick) |
| p7zip / 7-Zip | Archive previews/extraction support. | [p7zip-project/p7zip](https://github.com/p7zip-project/p7zip) / [ip7z/7zip](https://github.com/ip7z/7zip) |
| jq | Useful JSON helper alongside Yazi's JSON previews. | [jqlang/jq](https://github.com/jqlang/jq) |
| ripgrep | Useful search helper for file-manager workflows. | [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) |
| fd | Useful finder helper for file-manager workflows. | [sharkdp/fd](https://github.com/sharkdp/fd) |

### X11 / bspwm desktop stack

The `.chezmoiignore` skips the X11 desktop config unless chezmoi data sets `windowSystem` to `X11`. On an X11 machine using this profile, treat this whole stack as required for the desktop session.

| Program | | Repository / upstream |
| --- | --- | --- |
| Xorg / X11 | Needed for `.xinitrc`, `bspwm`, `sxhkd`, `polybar`, `feh`, and `setxkbmap`. | [freedesktop/xorg-xserver](https://gitlab.freedesktop.org/xorg/xserver) |
| bspwm | Tiling window manager controlled by `bspc`. | [baskerville/bspwm](https://github.com/baskerville/bspwm) |
| sxhkd | Hotkey daemon launched from `bspwmrc`. | [baskerville/sxhkd](https://github.com/baskerville/sxhkd) |
| polybar | Status bar launched from `bspwmrc`; config lives in `private_dot_config/polybar/`. | [polybar/polybar](https://github.com/polybar/polybar) |
| feh | Sets X11 wallpaper. | [derf/feh](https://github.com/derf/feh) |
| xorg-setxkbmap | Sets the keyboard layout to German in `bspwmrc`. | [freedesktop/xkeyboard-config](https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config) |
| xrdb | Loads `~/.Xresources` from `.xinitrc` when present. | [freedesktop/xorg-app-xrdb](https://gitlab.freedesktop.org/xorg/app/xrdb) |
| rofi | Program launcher bound to `super + space` in `sxhkdrc`. | [davatorium/rofi](https://github.com/davatorium/rofi) |
| iproute2 | Provides `ip` for the Polybar network script. | [iproute2/iproute2](https://github.com/iproute2/iproute2) |
| GNU grep | Provides `grep -P` for the Polybar network script. | [GNU grep](https://www.gnu.org/software/grep/) |

