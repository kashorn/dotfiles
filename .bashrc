# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

################################################
# prompt (must come after '. /etc/bashrc' 
#    due to that script's setting of prompt)
################################################
source ./git-completion.bash

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e "\033[0;31m"
  else if [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e "\033[0;33m"
  else if [[ $git_status =~ "nothing to commit" ]]; then
    echo -e "\033[0;32m"
  else
    echo -e $Color_Off
  fi fi fi
 }

# no Git branch
#export PS1="[\h:\u \W]\$ "
# Git branch, no color
#export PS1='[\h:\u \W$(parse_git_branch)]\$ '
# Git branch, with color (bold cyan == [\033[01;36m\] )
export PS1="[\[\033[00m\]\h:\u\[\033[0;36m\] \W\[\033[32m\]\[\$(git_color)\]\$(parse_git_branch)\[\033[00m\]]$\[\033[00m\] "
#export PS1="[\[\033[00m\]\h:\u \W\[\033[31m\]\$(parse_git_branch)\[\033[00m\]]$\[\033[00m\] "


###############################################
# Personalization
###############################################
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -Gflah'

#function parse_git_branch {
#git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
#}
#export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

#parse_git_branch() {
#git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

###############################################
# git
###############################################
function gdiff {
  git diff $1~1..$1
}


export NVM_DIR="/Users/kashorn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
