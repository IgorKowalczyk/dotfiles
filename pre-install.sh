#!/usr/bin/env bash

BLUE=$(printf '\033[0;34m')
GREEN=$(printf '\033[32m')
RESET=$(printf '\033[0m')
TAG=$(printf '\033[0;34m[Pre-Install]\033[0m')

# Install required packages for Fedora
echo "${TAG} ${BLUE}Installing required packages for Fedora${RESET}"
sudo dnf copr enable lionheartp/Hyprland -y
sudo dnf install 'dnf-command(config-manager)' -y
sudo dnf install -y gh zsh gcc g++ git curl wofi waybar dunst fastfetch nmtui blueman kvantum-qt5 pamixer btop swappy cliphist pavucontrol nm-applet ptyxis wl-paste dunstify gamemode restic gtk-murrine-engine sassc
sudo dnf install -y hyprland hyprshot hyprpaper hyprlock hyprsunset hyprland-qt-support hyprland-guiutils hyprpolkitagent
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

if [ ! -d "$HOME/.local/share/fonts/NerdFonts" ]; then
  echo "${TAG} ${BLUE}Installing NerdFonts${RESET}"
  git clone https://github.com/ryanoasis/nerd-fonts --depth 1 "$HOME/Downloads/nerd-fonts"
  
  sh $HOME/Downloads/nerd-fonts/install.sh
  
  echo "${TAG} ${BLUE}Cleaning NerdFonts${RESET}"
  rm "$HOME/Downloads/nerd-fonts" -fr
else
  echo "${TAG} ${GREEN}NerdFonts is already installed${RESET}"
fi

echo "${TAG} ${BLUE}Installing nvm${RESET}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

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

if [ ! -d "$HOME/.config/hypr/plugins/split-monitor-workspaces" ]; then
  echo "${TAG} ${BLUE}Clonning split-monitor-workspaces${RESET}"
  git clone https://github.com/zjeffer/split-monitor-workspaces.git --depth 1 "$HOME/.config/hypr/plugins/split-monitor-workspaces"
else
  echo "${TAG} ${GREEN}Hyprland plugin split-monitor-workspaces is already installed${RESET}"
fi

hyprpm reload

echo "${TAG} ${BLUE}Clonning Catppuccin-GTK-Theme${RESET}"
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git --depth 1 "$HOME/Downloads/Catppuccin-gtk"

echo "${TAG} ${BLUE}Installing Catppuccin-GTK-Theme${RESET}"
sudo sh $HOME/Downloads/Catppuccin-gtk/themes/install.sh -l -t lavender -c dark -s standard --tweaks macos black macchiato

sudo flatpak override --env=GTK_THEME=Catppuccin-Lavender-Dark-Macchiato

echo "${TAG} ${BLUE}Cleaning Catppuccin-GTK-Theme${RESET}"
rm "$HOME/Downloads/Catppuccin-gtk" -fr

echo "${TAG} ${BLUE}Installing bottles${RESET}"
flatpak install com.usebottles.bottles

echo "${TAG} ${BLUE}Installing resources monitor${RESET}"
flatpak install net.nokyan.Resources  

if [ ! -d "$HOME/.local/share/icons/rose-pine-hyprcursor" ]; then
  echo "${TAG} ${BLUE}Clonning rose-pine-hyprcursor${RESET}"
  git clone https://github.com/ndom91/rose-pine-hyprcursor.git --depth 1 "$HOME/.local/share/icons/rose-pine-hyprcursor"

  if [ ! -d "/usr/share/icons/rose-pine-hyprcursor" ]; then
    echo "${TAG} ${BLUE}Linking rose-pine-hyprcursor to /usr/share/icons${RESET}"
    sudo ln -s "$HOME/.local/share/icons/rose-pine-hyprcursor" "/usr/share/icons/rose-pine-hyprcursor"
  else
    echo "${TAG} ${GREEN}Cursor theme is already linked${RESET}"
  fi
else
  echo "${TAG} ${GREEN}Cursor theme is already installed${RESET}"
fi