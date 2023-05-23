# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # set "vim" as default editor
export LANG=ja_JP.UTF-8  # set language
export KCODE=u           # set encoding
export AUTOFEATURE=true  # automatically generate feature tests

autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

setopt correct           # correct mistyped commands
setopt prompt_subst      # enable command substitution in prompt
setopt notify            # report status of background jobs immediately

### Complement ###
autoload -U compinit; compinit # enable interpolation functionality.
setopt auto_list               # display list automatically in case of multiple candidates
setopt auto_menu               # display menu automatically in case of multiple candidates
setopt list_packed             # display candidates in one line
setopt list_types              # display file types in candidates
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case insensitive completion

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export ZSH="$HOME/.oh-my-zsh"

export PATH="/opt/homebrew/bin:$PATH"
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
source $HOME/.zsh/git-prompt.sh

# ------------------------------
# History
# ------------------------------
HISTFILE=~/.zsh_history   # the file where histories are saved
HISTSIZE=10000            # the number of history entries to save in a session
SAVEHIST=10000            # the number of history entries to save in a history file
setopt extended_history   # save timestamp of command in HISTFILE
setopt hist_ignore_dups   # ignore duplication command history list
setopt share_history      # share command history data with the other sessions
setopt hist_reduce_blanks # remove superfluous blanks before recording entry

# ------------------------------
# Alias
# ------------------------------

# display history with timestamp
alias history='history -E'

# conduct "ls" after "cd"
function cd() {
    builtin cd $@ && ls;
}

# ssh
alias ss="ssh sol"
alias sn="ssh nest"

# attatch icons to ls
alias ls="lsd"

# git
alias gi ="git"
alias gia="git add"
alias gic="git commit -m"
alias gip="git push"
alias gis="git status"
alias gim="git merge"

alias reload="source ~/.zshrc"
alias vi="vim"
