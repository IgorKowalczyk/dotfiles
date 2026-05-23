#!/usr/bin/env bash

BLUE=$(printf '\033[0;34m')
GREEN=$(printf '\033[32m')
RESET=$(printf '\033[0m')
TAG=$(printf '\033[0;34m[Pre-Install]\033[0m')

# Install required packages for Fedora
echo "${TAG} ${BLUE}Installing required packages for Fedora${RESET}"
sudo dnf copr enable lionheartp/Hyprland -y
sudo dnf install 'dnf-command(config-manager)' -y
sudo dnf install -y gh zsh gcc g++ git curl wofi waybar dunst fastfetch kvantum-qt5 pamixer btop swappy cliphist pavucontrol nm-applet ptyxis wl-paste dunstify gamemode restic gtk-murrine-engine
sudo dnf install -y hyprland hyprshot hyprsunset hyprland-qt-support hyprland-guiutils hyprpolkitagent
sudo dnf install -y hyprutils-devel hyprcursor-devel hyprlang-devel aquamarine-devel hyprgraphics-devel hyprwayland-scanner-devel hyprwire-devel hyprland-protocols-devel
sudo dnf install -y tomlplusplus-devel xcb-util-wm-devel xcb-util-errors-devel lua-devel libxkbcommon-devel libuuid-devel wayland-devel wayland-protocols-devel cairo-devel pango-devel pixman-devel libXcursor-devel libinput-devel mesa-libgbm-devel glib2-devel re2-devel muParser-devel lcms2-devel muParser-devel
if [ -f "$HOME/.gitconfig" ]; then
  if [ ! -f "$HOME/.gitconfig.local" ]; then
    echo "${TAG} ${BLUE}Copying .gitconfig to gitconfig.local${RESET}"
    if cp "$HOME/.gitconfig" "$HOME/.gitconfig.local"; then
      rm "$HOME/.gitconfig"
    else
      echo "${TAG} ${RED}Failed to copy .gitconfig to gitconfig.local${RESET}"
    fi
  else
    echo "${TAG} ${GREEN}.gitconfig.local already exists${RESET}"
  fi
else
  echo "${TAG} ${GREEN}.gitconfig does not exist${RESET}"
fi

# Check if .zshrc exists - copy to zshrc.local if it does
if [ -f "$HOME/.zshrc" ]; then
  if [ ! -f "$HOME/.zshrc.local" ]; then
    echo "${TAG} ${BLUE}Copying .zshrc to zshrc.local${RESET}"
    if cp "$HOME/.zshrc" "$HOME/.zshrc.local"; then
      rm "$HOME/.zshrc"
    else
      echo "${TAG} ${RED}Failed to copy .zshrc to zshrc.local${RESET}"
    fi
  else
    echo "${TAG} ${GREEN}.zshrc.local already exists${RESET}"
  fi
else
  echo "${TAG} ${GREEN}.zshrc does not exist${RESET}"
fi

# Change default shell
if [ ! $SHELL = "/usr/bin/zsh" ]; then
  echo "${TAG} ${BLUE}Changing default shell to zsh${RESET}"
  sudo chsh -s /bin/zsh
else
  echo "${TAG} ${GREEN}Already using ZSH${RESET}"
fi

# Check if oh-my-zsh is installed - install if not
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo "${TAG} ${BLUE}Installing oh-my-zsh${RESET}"
  bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "${TAG} ${GREEN}oh-my-zsh is already installed${RESET}"
fi

# Check if NerdFonts are installed - install if not
if [ ! -d "$HOME/.local/share/fonts/NerdFonts" ]; then
  echo "${TAG} ${BLUE}Installing NerdFonts${RESET}"
  mkdir -p "$HOME/.local/share/fonts/NerdFonts"
  curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/3270.zip -o "$HOME/.local/share/fonts/NerdFonts/3270.zip"
  unzip "$HOME/.local/share/fonts/NerdFonts/3270.zip" -d "$HOME/.local/share/fonts/NerdFonts"
  rm "$HOME/.local/share/fonts/NerdFonts/3270.zip"
else
  echo "${TAG} ${GREEN}NerdFonts is already installed${RESET}"
fi

# Check if atuin is installed - install if not
if [ ! -d "$HOME/.config/atuin" ]; then
  echo "${TAG} ${BLUE}Installing atuin${RESET}"
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
else
  echo "${TAG} ${GREEN}Atuin is already installed${RESET}"
fi

# Install scripts to $HOME/.local/bin
for file in scripts/*; do
  if [ -f "$file" ]; then
    if [ ! -f "$HOME/.local/bin/$(basename $file)" ]; then
      echo "${TAG} ${BLUE}Linking $file to $HOME/.local/bin${RESET}"
      ln -s "$(pwd)/$file" "$HOME/.local/bin/$(basename $file)"
      chmod +x "$HOME/.local/bin/$(basename $file)"
    else
      echo "${TAG} ${GREEN}$(basename $file) is already linked${RESET}"
  fi
  fi
done

echo "${TAG} ${BLUE}Enabling hyprpm${RESET}"
hyprpm update

echo "${TAG} ${BLUE}Installing hyprland plugins${RESET}"
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo

hyprpm add https://github.com/virtcode/hypr-dynamic-cursors
hyprpm enable dynamic-cursors

hyprpm add https://github.com/zjeffer/split-monitor-workspaces
hyprpm enable split-monitor-workspaces

hyprpm reload

# echo "${TAG} ${BLUE}Installing Discord${RESET}"
# flatpak install flathub com.discordapp.Discord -y --or-update

# echo "${TAG} ${BLUE}Installing overskride${RESET}"
# curl -L https://github.com/kaii-lb/overskride/releases/download/v0.6.1/overskride.flatpak -o "$HOME/Downloads/overskride.flatpak"
# sudo flatpak install "$HOME/Downloads/overskride.flatpak" -y --or-update
# rm "$HOME/Downloads/overskride.flatpak"

# Download Fausto-Korpsvart/Catppuccin-GTK-Theme
echo "${TAG} ${BLUE}Installing Catppuccin-GTK-Theme${RESET}"
git clone Fausto-Korpsvart/Catppuccin-GTK-Theme --depth 1 "$HOME/Downloads/Catppuccin-gtk"

echo "${TAG} ${BLUE}Installing Catppuccin-GTK-Theme${RESET}"
cd "$HOME/Downloads/Catppuccin-gtk" 
sudo ./install.sh -l -t lavender -c dark -s standard --tweaks macos black macchiato
