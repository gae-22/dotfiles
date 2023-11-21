# Fig pre block. Keep at the top of this file. #####################################################

[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

#####################################################################################################


export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"


# Fig post block. Keep at the bottom of this file. ##################################################

[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"

#####################################################################################################
