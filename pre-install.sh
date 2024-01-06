#!/usr/bin/env bash

BLUE=$(printf '\033[34m')
GREEN=$(printf '\033[32m')
RESET=$(printf '\033[0m')

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

# Install atuin
bash -c "$(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)"
atuin login

# Check if nvm is installed
NVM="$HOME/.nvm"
if [ ! -d "$NVM" ]; then
   echo "${BLUE}Installing nvm${RESET}"
   bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh)"
 else
  echo "${GREEN}NVM already installed${RESET}"
fi