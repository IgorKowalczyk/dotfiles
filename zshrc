# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

export ZSH="$HOME/.oh-my-zsh"

# Set theme to gentoo
ZSH_THEME="gentoo"

# update automatically without asking
zstyle ':omz:update' mode auto

plugins=(git git-extras nvm docker npm zsh-autosuggestions)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
alias ppnm=pnpm
alias pmnp=pnpm
alias pnmp=pnpm
alias pmpn=pnpm
alias pnpp=pnpm

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git GPG Key
export GPG_TTY=\$(tty)

# Fix $PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Fuck it! Fix it!
eval $(thefuck --alias)