if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="original"
# ZSH_THEME='robbyrussell'
ZSH_THEME="powerlevel10k/powerlevel10k"

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

alias ss="wezterm ssh sol"
alias sn="wezterm ssh nest"

alias vi="vim"
alias ls="exa --icons"
alias la="ls -a"

alias gi ="git"
alias gia="git add"
alias gic="git commit -m"
alias gip="git push"
alias gis="git status"
alias gim="git merge"

alias reload="source ~/.zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

source ~/powerlevel10k/powerlevel10k.zsh-theme

setopt hist_ignore_dups  # 同じコマンドを履歴に残さない
setopt share_history     # 同時に起動したzshで履歴を共有する
