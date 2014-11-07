# add ~/bin to PATH
export PATH=~/bin:$PATH

# cOloRs FOr DaH prOmPt!!!!11!!!1
Purple='\e[0;35m'
Cyan='\e[0;36m'
BGreen='\e[1;32m'
White='\e[0;37m'

# git auto completion
if [ -f ~/profile/.git-completion.bash ]; then
  . ~/profile/.git-completion.bash
fi

# to show git branch in prompt
source ~/profile/.git-prompt.sh

# print shorter working path directory
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

export MYPSDIR='$(echo -n "${PWD/#$HOME/~}" | awk "$MYPSDIR_AWK")'

# bash prompt
export PS1="\[$BGreen\]\t⚡ \u\[$Cyan\] $(eval 'echo ${MYPSDIR}')\[\033[m\]\[$Purple\]\$(__git_ps1)\[$White\]\$ "
