# cOloRs FOr DaH prOmPt!!!!11!!!1
Purple='\e[0;35m'
Cyan='\e[0;36m'
BGreen='\e[1;32m'
White='\e[0;37m'

# boxen ish
source /opt/boxen/env.sh

# git auto completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# to show git branch in prompt
source ~/.git-prompt.sh

# bash prompt
PS1="\[$BGreen\]\t-\u\[$Cyan\]\w\[\033[m\]\[$Purple\]\$(__git_ps1)\[$White\]\$ "
