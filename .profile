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

# function to print shorter working path directory
MYPSDIR_AWK=$(cat << 'EOF'
BEGIN { FS = OFS = "/" }
{ 
   if (length($0) > 16 && NF > 4)
      print $1,$2,"." NF-4 ".",$(NF-1),$NF
   else
      print $0
}
EOF
)
# replacement for \w prompt expansion
export MYPSDIR='$(echo -n "${PWD/#$HOME/~}" | awk "$MYPSDIR_AWK")'

# bash prompt
export PS1="\[$BGreen\]\t-\u\[$Cyan\] $(eval 'echo ${MYPSDIR}')\[\033[m\]\[$Purple\]\$(__git_ps1)\[$White\]\$ "
