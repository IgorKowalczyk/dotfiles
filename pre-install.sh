#!/usr/bin/env bash

BLUE=$(printf '\033[0;34m')
GREEN=$(printf '\033[32m')
RESET=$(printf '\033[0m')

# Install required packages for Fedora
echo "${BLUE}Installing required packages for Fedora${RESET}"
sudo dnf copr enable solopasha/hyprland -y
sudo dnf install 'dnf-command(config-manager)' -y
sudo dnf install -y gh zsh gcc g++ git curl hyprland hyprshot hyprsunset wofi waybar cava dunst fastfetch kvantum-qt5 pamixer btop swappy cliphist pavucontrol blueman nm-applet ptyxis wl-paste

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

# Check if .zshrc exists - copy to zshrc.local if it does
if [ -f "$HOME/.zshrc" ]; then
  if [ ! -f "$HOME/.zshrc.local" ]; then
    echo "${BLUE}Copying .zshrc to zshrc.local${RESET}"
    mkdir -p "$HOME/dotfiles/zsh"
    if cp "$HOME/.zshrc" "$HOME/dotfiles/zsh/zshrc.local"; then
      rm "$HOME/.zshrc"
    else
      echo "${RED}Failed to copy .zshrc to zshrc.local${RESET}"
    fi
  else
    echo "${GREEN}.zshrc.local already exists${RESET}"
  fi
else
  echo "${GREEN}.zshrc does not exist${RESET}"
fi

# Change default shell
if [ ! $SHELL = "/usr/bin/zsh" ]; then
  echo "${BLUE}Changing default shell to zsh${RESET}"
  sudo chsh -s /bin/zsh
else
  echo "${GREEN}Already using ZSH${RESET}"
fi

# Check if oh-my-zsh is installed - install if not
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo "${BLUE}Installing oh-my-zsh${RESET}"
  bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "${GREEN}oh-my-zsh is already installed${RESET}"
fi

# Check if NerdFonts are installed - install if not
if [ ! -d "$HOME/.local/share/fonts/NerdFonts" ]; then
  echo "${BLUE}Installing NerdFonts${RESET}"
  mkdir -p "$HOME/.local/share/fonts/NerdFonts"
  curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/3270.zip -o "$HOME/.local/share/fonts/NerdFonts/3270.zip"
  unzip "$HOME/.local/share/fonts/NerdFonts/3270.zip" -d "$HOME/.local/share/fonts/NerdFonts"
  rm "$HOME/.local/share/fonts/NerdFonts/3270.zip"
else
  echo "${GREEN}NerdFonts is already installed${RESET}"
fi

# Check if atuin is installed - install if not
if [ ! -d "$HOME/.config/atuin" ]; then
  echo "${BLUE}Installing atuin${RESET}"
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
else
  echo "${GREEN}Atuin is already installed${RESET}"
fi

# Check if starship is installed
for file in scripts/*; do
  if [ -f "$file" ]; then
    if [ ! -f "$HOME/.local/bin/$(basename $file)" ]; then
      echo "${BLUE}Linking $file to $HOME/.local/bin${RESET}"
      ln -s "$(pwd)/$file" "$HOME/.local/bin/$(basename $file)"
      chmod +x "$HOME/.local/bin/$(basename $file)"
    else
      echo "${GREEN}$(basename $file) is already linked${RESET}"
  fi
  fi
done

# echo "${BLUE}Enabling hyprpm${RESET}"
# hyprpm update

