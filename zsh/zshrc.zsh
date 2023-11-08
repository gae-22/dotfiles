if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
  fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# themes
# ZSH_THEME="original"
# ZSH_THEME='robbyrussell'
ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim               # set "vim" as default editor
export LANG=ja_JP.UTF-8         # set language
export KCODE=u                  # set encoding
export AUTOFEATURE=true         # automatically generate feature tests

autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

setopt correct                  # correct mistyped commands
setopt notify                   # report status of background jobs immediately

# ------------------------------
# History
# ------------------------------
HISTFILE=~/.zsh_history         # the file where histories are saved
HISTSIZE=1000                   # the number of history entries to save in a session
SAVEHIST=1000                   # the number of history entries to save in a history file
setopt hist_ignore_dups         # ignore duplication command history list
setopt share_history            # share command history data with the other sessions
setopt hist_reduce_blanks       # remove superfluous blanks before recording entry

# ------------------------------
# Alias
# ------------------------------
# ssh
alias ss="ssh sol"
alias sn="ssh nest"

alias ls="lsd"
alias vi="nvim"

# git
alias gi="git"
alias gia="git add"
alias gic="git commit -m"
alias gip="git push"
alias gis="git status"
alias gim="git merge"

alias reload="source ~/.zshrc"
alias mtg="cd ~/dev/mma/mma-meeting && pipenv shell"
alias run="python server.py"

export PATH="$PATH:/sbin"
export PATH="/opt/homebrew/sbin:$PATH"
eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
