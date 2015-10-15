
if [ -f ~/.localrc ]; then
    . ~/.localrc
fi

if [ -f ~/.envrc ]; then
    . ~/.envrc
fi

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=">"
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHOW_CHANGESET=true

#load zgen
source "${HOME}/bin/zgen/zgen.zsh"


# check if there's no init script
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen prezto prompt theme 'powerlevel9k'

  zgen prezto


  # completions
  zgen load zsh-users/zsh-completions src
  zgen prezto
  zgen prezto git
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto completion
  zgen pmodule bhilburn/powerlevel9k master

  # save all to init script
  zgen save
fi

zstyle ':completion:*' special-dirs true

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/bryan/.gvm/bin/gvm-init.sh" ]] && source "/Users/bryan/.gvm/bin/gvm-init.sh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
