# Dotfiles managed by Chezmoi

Initiate on a new system with:
```zsh
chezmoi init --apply git@github.com:Hasseroeder/dotfiles.git
```

Or clone with:
```zsh
git clone https://github.com/Hasseroeder/dotfiles.git
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
### Required for the base dotfiles

These are non-optional for the current `dot_zshrc.tmpl`: the shell startup file sources them directly, so a new machine should install/bootstrap them before applying these dotfiles or before starting a login shell.

| Program | Why it is needed | Repository |
| --- | --- | --- |
| Git | Clones this repo and is used by Oh My Zsh/Zinit plugins. | [git/git](https://github.com/git/git) |
| chezmoi | Applies these dotfiles from the source repo. | [twpayne/chezmoi](https://github.com/twpayne/chezmoi) |
| Zsh | Primary shell -- configured by `dot_zshrc.tmpl`. | [zsh-users/zsh](https://github.com/zsh-users/zsh) |
| Oh My Zsh | Sourced from `~/.oh-my-zsh/oh-my-zsh.sh` | [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) |
| Powerlevel10k | Sourced from `~/.powerlevel10k/powerlevel10k.zsh-theme` | [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| Zinit | Sourced from `~/.local/share/zinit/zinit.git/zinit.zsh` | [zdharma-continuum/zinit](https://github.com/zdharma-continuum/zinit) |

### Installed by Zinit at shell startup

These are not OS packages in the scripts below; Zinit pulls them automatically once Zinit itself exists.

| Plugin | Repository |
| --- | --- |
| zinit-annex-as-monitor | [zdharma-continuum/zinit-annex-as-monitor](https://github.com/zdharma-continuum/zinit-annex-as-monitor) |
| zinit-annex-bin-gem-node | [zdharma-continuum/zinit-annex-bin-gem-node](https://github.com/zdharma-continuum/zinit-annex-bin-gem-node) |
| zinit-annex-patch-dl | [zdharma-continuum/zinit-annex-patch-dl](https://github.com/zdharma-continuum/zinit-annex-patch-dl) |
| zinit-annex-rust | [zdharma-continuum/zinit-annex-rust](https://github.com/zdharma-continuum/zinit-annex-rust) |
| zsh-syntax-highlighting | [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) |
| zsh-completions | [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) |
| zsh-autosuggestions | [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) |
| fzf-tab | [Aloxaf/fzf-tab](https://github.com/Aloxaf/fzf-tab) |

### Optional shell and terminal enhancements

These programs are guarded with `command -v`, file-existence checks, or directory checks. The dotfiles continue to work without them, but install them for the intended experience.

| Program |  | Repository |
| --- | --- | --- |
| fzf | Oh My Zsh plugin plus key bindings/completion if distro files exist under `/usr/share/doc/fzf/examples` or `/usr/share/fzf`. | [junegunn/fzf](https://github.com/junegunn/fzf) |
| nvm | Node Version Manager integration if `~/.nvm/nvm.sh` exists. | [nvm-sh/nvm](https://github.com/nvm-sh/nvm) |
| zoxide | Smarter `cd`; initialized only when `zoxide` is on `PATH`. | [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) |
| fastfetch | Runs on interactive shells and powers `~/.config/fastfetch`. | [fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| Neovim | Sets `EDITOR=nvim` and aliases `vim`/`neovim`; otherwise falls back to `vi`. | [neovim/neovim](https://github.com/neovim/neovim) |
| eza | Replaces `ls`/`ll` aliases with icon/git-aware listings; otherwise uses classic `ls`. | [eza-community/eza](https://github.com/eza-community/eza) |
| tree | Adds a `tree -a` alias. | [Old-Man-Programmer/tree](https://github.com/Old-Man-Programmer/tree) |
| bat / batcat | Aliased to `bat` for convenience. | [sharkdp/bat](https://github.com/sharkdp/bat) |
| nudoku | CLI sudoku game, aliased to `sudoku`. | [jubalh/nudoku](https://github.com/jubalh/nudoku) |
| NetHack | CLI nethack game, aliased to `nethack`. | [NetHack/NetHack](https://github.com/NetHack/NetHack) |

### Optional fastfetch support tools

`fastfetch` itself is optional, but when it is installed these configs expect the usual Unix tools below for custom command modules and the CachyOS logo swap helper.

| Program | Why it is useful here | Repository |
| --- | --- | --- |
| GNU awk | `disk.sh` uses `awk` with `strtonum`, which is provided by `gawk`. | [mitchcapper/gawk](https://github.com/mitchcapper/gawk) |
| GNU coreutils | Provides `df` and `date` used by the fastfetch helper scripts. | [coreutils/coreutils](https://github.com/coreutils/coreutils) |
| Python 3 | Runs `swap_logo_cachyos-x8664.py` on `cachyos-x8664`. | [python/cpython](https://github.com/python/cpython) |

### Optional Yazi file-manager stack

The `.chezmoiignore` skips the Yazi config when `yazi` is not installed. If you install Yazi, the config can also use these helper programs for previews and openers.

| Program | What enables it | Repository / upstream |
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

### Optional X11 / bspwm desktop stack

The `.chezmoiignore` skips the X11 desktop config unless chezmoi data sets `windowSystem` to `X11`. On an X11 machine using this profile, treat this whole stack as required for the desktop session.

| Program | What enables it | Repository / upstream |
| --- | --- | --- |
| Xorg / X11 | Needed for `.xinitrc`, `bspwm`, `sxhkd`, `polybar`, `feh`, and `setxkbmap`. | [freedesktop/xorg-xserver](https://gitlab.freedesktop.org/xorg/xserver) |
| bspwm | Tiling window manager controlled by `bspc`. | [baskerville/bspwm](https://github.com/baskerville/bspwm) |
| sxhkd | Hotkey daemon launched from `bspwmrc`. | [baskerville/sxhkd](https://github.com/baskerville/sxhkd) |
| polybar | Status bar launched from `bspwmrc`; config lives in `private_dot_config/polybar/`. | [polybar/polybar](https://github.com/polybar/polybar) |
| feh | Randomizes and sets the X11 wallpaper. | [derf/feh](https://github.com/derf/feh) |
| xorg-setxkbmap | Sets the keyboard layout to German in `bspwmrc`. | [freedesktop/xkeyboard-config](https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config) |
| xrdb | Loads `~/.Xresources` from `.xinitrc` when present. | [freedesktop/xorg-app-xrdb](https://gitlab.freedesktop.org/xorg/app/xrdb) |
| rofi | Program launcher bound to `super + space` in `sxhkdrc`. | [davatorium/rofi](https://github.com/davatorium/rofi) |
| iproute2 | Provides `ip` for the Polybar network script. | [iproute2/iproute2](https://github.com/iproute2/iproute2) |
| GNU grep | Provides `grep -P` for the Polybar network script. | [GNU grep](https://www.gnu.org/software/grep/) |

