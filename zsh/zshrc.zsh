[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="original"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/git-prompt.sh

alias ss="ssh sol"
alias sn="ssh nest"

alias vi="vim"

alias gi ="git"
alias gia="git add"
alias gic="git commit -m"
alias gip="git push"
alias gis="git status"
alias gim="git merge"

alias reload="source ~/.zshrc"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


