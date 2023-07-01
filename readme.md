<img width="170" height="170" align="left" style="float: left; margin: 0 10px 0 0; border-radius: 50%;" src="https://media.discordapp.net/attachments/710425657003212810/933327129305821184/circle.png">

## Igor Kowalczyk - `~/.dotfiles`

> 📦 All my `~/.dotfiles` for Linux. Managed by [Dotbot](https://github.com/anishathalye/dotbot)

[![GitHub License](https://img.shields.io/github/license/igorkowalczyk/dotfiles?color=%2334D058&logo=github&style=flat-square&label=License)](https://github.com/igorkowalczyk/dotfiles/blob/main/license.md)
[![Version](https://img.shields.io/github/v/release/igorkowalczyk/dotfiles?color=%2334D058&logo=github&style=flat-square&label=Version)](https://github.com/igorkowalczyk/dotfiles/releases)
[![Vulnerabilities](https://img.shields.io/snyk/vulnerabilities/github/igorkowalczyk/dotfiles?color=%2334D058&logo=github&style=flat-square&label=Vulnerabilities)](https://github.com/igorkowalczyk/dotfiles)
<br><br><br>

## ⚡️ Installation

> **Note**
> If you have `~/gitconfig` file, please remove it before installation and paste your data to `~/dotfiles/git/gitconfig.local` file (it will be created after installation)

```bash
# Git clone with submodules
git clone --recurse-submodules https://github.com/igorkowalczyk/dotfiles

# Run install script
cd dotfiles && ./install.sh

source ~/.zshrc

```

> **Warning**:
> Script will install [Zsh](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/) and [Node Version Manager](https://github.com/nvm-sh/nvm) if not installed.

# 📦 Content

- `zsh/zshrc`: [Zsh](https://www.zsh.org/) config with [Oh My Zsh](https://ohmyz.sh/)
- `pre-install.sh`: [Node Version Manager](https://github.com/nvm-sh/nvm)
- `oh-my-zsh/custom/plugins`: [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- `oh-my-zsh/custom/plugins`: [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
- `git`: [Git](https://git-scm.com/) config
- Aliases for `git`, `pnpm`, `nvm` and more

## ⁉️ Issues

If you have any issues with the page please create [new issue here](https://github.com/igorkowalczyk/dotfiles/issues)

## 📥 Pull Requests

When submitting a pull request:

- Clone the repo.
- Create a branch off of main and give it a meaningful name (e.g. my-awesome-new-feature).
- Open a [pull request](https://github.com/igorkowalczyk/dotfiles/pulls) on [GitHub](https://github.com) and describe the feature or fix.

## 📋 License

This project is licensed under the MIT. See the [LICENSE](https://github.com/igorkowalczyk/dotfiles/blob/main/license.md) file for details
