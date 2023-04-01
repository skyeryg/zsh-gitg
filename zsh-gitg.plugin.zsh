#!/usr/bin/env zsh

GITG_BASE_DIR=${GITG_BASE_DIR:-$HOME/src}

__norm_repo() {
  local repo=$argv[1]
  typeset -A repo_alias=("github://" "https://github.com/" "gitee://" "https://gitee.com/")
  for i (${(k)repo_alias}) {
    if [[ $repo == $i* ]]; then
      echo ${repo/#$i/$repo_alias[$i]}.git
      return
    fi
  }

  if [[ $repo == *:* ]]; then
    echo $repo
  else
    echo https://github.com/$repo.git
  fi
}

__url2dir() {
  local url=$argv[1]
  url=${url/#*@}
  url=${url/#*\/\/}
  url=${url/%.git}
  url=${url//:/\/}
  echo $url
}

gitg () {
  if (( ! ${+argv[1]} )); then
    echo "USAGE: gitg [repo]"
    return 127
  fi

  local repo=$argv[1]
  local repo_url=$(__norm_repo $repo)
  local dir=$(__url2dir $repo_url)
  typeset +x directory=$GITG_BASE_DIR/$dir

  if [[ -a $directory ]]; then
    print -P "%B%F{blue}$directory%b%f already exist"
  else
    print -P "Start adding repository %B%F{green}$repo_url%b%f"
    git clone --depth 1 --recursive $repo_url $directory
  fi

  [[ $? -eq 0 ]] && {
    print -P "Change directory to %B%F{blue}$directory%b%f"
    cd $directory
  }
}
