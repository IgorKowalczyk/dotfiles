#!/usr/bin/env bash

BLUE=$(printf '\033[34m')
GREEN=$(printf '\033[32m')
RESET=$(printf '\033[0m')

# Check if .gitconfig exists, if so - copy it to gitconfig.local
# if [ -f "$HOME/.gitconfig" ]; then
#   echo "${BLUE}Copying .gitconfig to .gitconfig.local${RESET}"
#   cp "$HOME/.gitconfig" "$HOME/.gitconfig.local"
# else
#   echo "${GREEN}.gitconfig not found${RESET}"
# fi

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
  echo "${GREEN}oh-my-zsh already installed${RESET}"
fi

# Check if atuin is installed
ATUINDIR="$HOME/.config/atuin"

if [ ! -d "$ATUINDIR" ]; then
  echo "${BLUE}Installing atuin${RESET}"
  bash -c "$(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)"
else
  echo "${GREEN}atuin already installed${RESET}"
fi

# Check if nvm is installed
NVM="$HOME/.nvm"
if [ ! -d "$NVM" ]; then
   echo "${BLUE}Installing nvm${RESET}"
   bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh)"
 else
  echo "${GREEN}NVM already installed${RESET}"
fi