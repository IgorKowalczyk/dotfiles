#!/usr/bin/env bash
BLUE=$(printf '\033[34m')
GREEN=$(printf '\033[32m')
RESET=$(printf '\033[0m')

# Install required packages for Fedora
echo "${BLUE}Installing required packages for Fedora${RESET}"
sudo dnf copr enable solopasha/hyprland -y
sudo dnf install 'dnf-command(config-manager)' -y
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo -y
sudo dnf install gh --repo gh-cli -y
sudo dnf install -y zsh git curl hyprland hyprshot rofi waybar cava dunst fastfetch kvantum-qt5 wofi pamixer btop swappy plasma-discover pavucontrol blueman konsole NetworkManager-tui filelight

# Check if .gitconfig exists and .gitconfig.local does not exist, if so - copy it to gitconfig.local and remove it
if [ -f "$HOME/.gitconfig" ]; then
  if [ ! -f "$HOME/.gitconfig.local" ]; then
    echo "${BLUE}Copying .gitconfig to gitconfig.local${RESET}"
    mkdir -p "$HOME/dotfiles/git"
    if cp "$HOME/.gitconfig" "$HOME/dotfiles/git/gitconfig.local"; then
      rm "$HOME/.gitconfig"
    else
      echo "${RED}Failed to copy .gitconfig to gitconfig.local${RESET}"
    fi
  else
    echo "${GREEN}.gitconfig.local already exists${RESET}"
  fi
else
  echo "${GREEN}.gitconfig does not exist${RESET}"
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

echo "${BLUE}Installing atuin${RESET}"
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

echo "${BLUE}Enabling hyprpm${RESET}"
hyprpm update
#hyprpm add https://github.com/KZDKM/Hyprspace
#hyprpm enable Hyprspace
hyprpm enable hyprexpo