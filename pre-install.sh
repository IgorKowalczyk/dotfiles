#!/usr/bin/env bash
BLUE=$(printf '\033[34m')
GREEN=$(printf '\033[32m')
RESET=$(printf '\033[0m')

# Install required packages for Fedora
echo "${BLUE}Installing required packages for Fedora${RESET}"
sudo dnf install -y zsh git curl hyprland hyprshot rofi waybar cava dunst fastfetch kvantum-qt5 wofi pamixer btop swappy plasma-discover pavucontrol blueman-manager konsole nmtui filelight

# Check if .gitconfig exists, if so - copy it to gitconfig.local
if [ -f "$HOME/.gitconfig" ]; then
  echo "${BLUE}Copying .gitconfig to gitconfig.local${RESET}"
  cp "$HOME/.gitconfig" "$HOME/dotfiles/git/gitconfig.local"
  rm "$HOME/.gitconfig"
else
  echo "${GREEN}.gitconfig not found${RESET}"
fi

# Change default shell
if [ ! $SHELL = "/usr/bin/zsh" ]; then
  echo "${BLUE}Changing default shell to zsh${RESET}"
  sudo chsh -s /bin/zsh
else
  echo "${GREEN}Already using ZSH${RESET}"
fi

# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo "${BLUE}Installing oh-my-zsh${RESET}"
  bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "${GREEN}oh-my-zsh is already installed${RESET}"
fi
