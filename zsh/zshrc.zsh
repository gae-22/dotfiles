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

setopt share_history     # 同時に起動したzshで履歴を共有する
setopt hist_ignore_space # 行頭にスペースがあるコマンドは履歴に残さない
setopt hist_reduce_blanks # 余分なスペースは詰める
setopt hist_verify       # 編集後のコマンドラインを確認する
setopt inc_append_history # 既存の履歴に追加する
setopt hist_expire_dups_first # 重複したコマンドのうち古い方を削除する
