if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# themes
# ZSH_THEME="original"
# ZSH_THEME='robbyrussell'
ZSH_THEME="powerlevel10k/powerlevel10k"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export PATH=$PATH:/usr/local/texlive/2023/bin/universal-darwin

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

[[ ! -f ~/dotfiles/zsh/p10k.zsh ]] || source ~/dotfiles/zsh/p10k.zsh

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source ~/.oh-my-zsh/oh-my-zsh.sh
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

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
unset ZSH_AUTOSUGGEST_USE_ASYNC # disable async autosuggest

# ------------------------------
# History
# ------------------------------
HISTFILE=~/.zsh_history         # the file where histories are saved
HISTSIZE=1000                   # the number of history entries to save in a session
SAVEHIST=1000                   # the number of history entries to save in a history file
setopt hist_ignore_dups         # ignore duplication command history list
setopt share_history            # share command history data with the other sessions
setopt hist_reduce_blanks       # remove superfluous blanks before recording entry
zshaddhistory() {[[ "$?" == 0 ]]}

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

# others
alias mkcd="mkdir"
alias reload="source ~/.zshrc"
alias activate="source .venv/bin/activate"

alias qiita="npx qiita"
alias zenn="npx zenn"
alias att="atcoder-tools"
alias system_profiler="/usr/sbin/system_profiler"
source "$HOME/.rye/env"
