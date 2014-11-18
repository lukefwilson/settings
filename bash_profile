# add ~/bin to PATH
export PATH=~/bin:$PATH

# cOloRs FOr DaH prOmPt!!!!11!!!1
c_purple='\[\e[0;35m\]'
c_cyan='\[\e[0;36m\]'
c_green_bold='\[\e[1;32m\]'
c_red_bold='\[\e[1;31m\]'
c_reset='\[\e[0m\]'

# git auto completion
if [ -f ~/profile/.git-completion.bash ]; then
  . ~/profile/git-completion.bash
fi

# to show git branch in prompt -- may not need it
# source ~/profile/git-prompt.sh

source ~/profile/short-working-directory.sh

colored_time() {
    status_color=$?

    if [[ "$status_color" != "0" ]]; then
        status_color="${c_red_bold}"
    else
        status_color="${c_green_bold}"
    fi

    echo "$status_color\t${c_reset}"
}

# determines if the git branch you are on is clean or dirty
git_prompt () {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    git_start="("
    git_end=")"
  else
    git_start="{"
    git_end="}"
  fi

  echo " $git_start$git_branch$git_end"
}


PROMPT_COMMAND='PS1="$(colored_time)⚡ \u${c_cyan} $(shorten_path "\w" 20)${c_purple}\$(git_prompt)${c_reset} > "'

# always show ls with colors, including hidden, and humanized size
export LSCOLORS=GxBxhxDxdxxahadadaeaea
alias ls='ls -Gha'
