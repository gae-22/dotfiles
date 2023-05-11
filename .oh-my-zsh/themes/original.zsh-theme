function prompt {
  brace_start='%{'
  brace_end='%}'
  text_white='\e[38;5;252m'
  reset='%{\e[0m%}'

  dir_text_color="${brace_start}${text_white}${brace_end}"
  dir="${dir_text_color}%~${reset}"

  echo "${dir}"
}

# 改行+矢印
function last {
  brace_start='%{'
  brace_end='%}'

  text_cyan='\e[38;5;087m'

  reset='%{\e[0m%}'
  allow='\uf101'

  allow_color="${brace_start}${text_cyan}${brace_end}"
  allow_with_color="${allow_color}${allow}${reset}"

  echo "\n${allow_with_color} "
}

# git ブランチ名の表示
function git-current-branch {
  branch='\ue0a0'
  green='%{\e[38;5;114m%}'
  red='%{\e[38;5;001m%}'
  yellow='%{\e[38;5;227m%}'
  blue='%{\e[38;5;033m%}'
  reset='%{\e[0m%}'

  # ブランチマーク
  if ! git rev-parse 2> /dev/null; then
    return
  fi

  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`

  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # add されていないファイルがある状態
    branch_status="${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # commit されていないファイルがある状態
    branch_status="${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクト
    echo "${red}${branch}!(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${blue}${branch}"
  fi

  # ブランチ名の表示
  echo " ${branch_status}$branch_name${reset}"
}

# 右側に時間表示
function rprompt {
  echo "%D %t"
}

PROMPT=`prompt`
PROMPT+='`git-current-branch`'
PROMPT+=`last`
RPROMPT=`rprompt`

# コマンドの実行ごとに改行
function precmd() {
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
    NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
    echo ""
  fi
}

