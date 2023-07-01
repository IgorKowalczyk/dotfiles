export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"

# update automatically without asking
zstyle ':omz:update' mode auto

plugins=(git git-extras nvm docker npm)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions plugin
source $ZSH/custom/plugins/zsh-autosuggestions

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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git GPG Key
export GPG_TTY=\$(tty)
