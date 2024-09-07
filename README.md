![Dotfiles](https://github.com/IgorKowalczyk/dotfiles/assets/49127376/9747b962-2c1b-4eb9-a0ea-3ddb5b1d3923)

<div align="center">
  <a aria-label="GitHub License" href="https://github.com/igorkowalczyk/dotfiles/blob/main/license.md">
    <img src="https://img.shields.io/github/license/igorkowalczyk/dotfiles?color=%2334D058&logo=github&style=flat-square&label=License">
  </a>
  <a aria-label="Version" href="https://github.com/igorkowalczyk/dotfiles/releases">
    <img src="https://img.shields.io/github/v/release/igorkowalczyk/dotfiles?color=%2334D058&logo=github&style=flat-square&label=Version">
  </a>
</div>

---

## 🛠️ Installation

**Before you start**: If you have `~/.gitconfig` file, please copy and paste your data to `~/dotfiles/git/gitconfig.local` file (it will be created after installation). Don't forget to remove old `~/.gitconfig` file! This file will be automatically included in new `~/.gitconfig` file.

### 1. 🐧 Install required packages

#### 🎩 Fedora

```bash
sudo dnf install zsh git curl hyprland hyprshot rofi waybar cava dunst fastfetch kvantum-qt5 wofi pamixer btop swappy plasma-discover pavucontrol blueman-manager konsole nmtui filelight
```

### 2. 🚀 Install

```bash
# Git clone with submodules
git clone --recurse-submodules https://github.com/igorkowalczyk/dotfiles

# Run install script
cd dotfiles && ./install.sh

source ~/.zshrc

# Install Hyprspace
hyprpm add https://github.com/KZDKM/Hyprspace
hyprpm enable Hyprspace

```

# 📦 Content

- `config/` - Config files for:
  - `btop/` - [btop](https://github.com/aristocratos/btop) config, a monitor for resources
  - `cava/` - [cava](https://github.com/karlstav/cava) config, an audio visualizer
  - `dunst/` - [dunst](https://dunst-project.org/) config, a lightweight notification-daemon
  - `fastfetch/` - [fastfetch](https://github.com/fastfetch-cli/fastfetch) config, a system information tool
  - `hypr/` - [Hyprland(](https://hyprland.org/) config, tiling compositor with the looks
  - `Kvantum/` - [Kvantum](https://github.com/tsujan/Kvantum/tree/master) config, SVG-based theme engine for Qt4/Qt5, KDE and LXQt
  - `rofi/` - [Rofi](https://github.com/davatorium/rofi) config, application launcher
  - `turborepo/` - [turborepo](https://turbo.build/) config, a build system for monorepos
  - `waybar/` - [Waybar](https://github.com/Alexays/Waybar) config, a highly customizable bar
  - `wofi/` - [Wofi](https://hg.sr.ht/~scoopta/wofi) config, a launcher apps
- `zsh/` - [Zsh](https://www.zsh.org/) config with [Oh My Zsh](https://ohmyz.sh/), includes aliases for Docker, Debian, NVM (Node Version Manager) and [TheFuck](https://github.com/nvbn/thefuck)
- `oh-my-zsh/` - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete) plugins.
- `git/` - [Git](https://git-scm.com/) config with [git-extras](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git-extras/git-extras.plugin.zsh) and alliases.
- `dotbot/` - [Dotbot](https://github.com/anishathalye/dotbot) repository

## ⁉️ Issues

If you have any issues with the page please create [new issue here](https://github.com/igorkowalczyk/dotfiles/issues)

## 📥 Pull Requests

When submitting a pull request:

- Clone the repo.
- Create a branch off of main and give it a meaningful name (e.g. my-awesome-new-feature).
- Open a [pull request](https://github.com/igorkowalczyk/dotfiles/pulls) on [GitHub](https://github.com) and describe the feature or fix.

## 📋 License

This project is licensed under the MIT. See the [LICENSE](https://github.com/igorkowalczyk/dotfiles/blob/main/license.md) file for details
