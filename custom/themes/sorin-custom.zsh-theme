# sorin-custom.zsh-theme

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  function git_prompt_info() {
    if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
      ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
      ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
      echo "$(parse_git_dirty)$(git_prompt_status)$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
  }

  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  
  PROMPT='%{$fg[blue]%}%~$(git_prompt_info)%{$reset_color%} '

  ZSH_THEME_GIT_PROMPT_PREFIX=":"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%}"

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[yellow]%}"
  ZSH_THEME_GIT_PROMPT_MODIFIED=""
  ZSH_THEME_GIT_PROMPT_DELETED=""
  ZSH_THEME_GIT_PROMPT_RENAMED=""
  ZSH_THEME_GIT_PROMPT_UNMERGED=""
  ZSH_THEME_GIT_PROMPT_UNTRACKED=""
else 
  MODE_INDICATOR="❮❮❮"
  
  PROMPT='%c$(git_prompt_info) $(git_prompt_status) %(!.#.❯) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi

