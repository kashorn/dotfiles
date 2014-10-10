# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

################################################
# prompt (must come after '. /etc/bashrc' 
#    due to that script's setting of prompt)
################################################
source ~/git-completion.bash

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
alias ls='ls -Gfh'

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

# git/rally aliases
alias gitrally='git lp | egrep "\[?(S|DE|TA)[0-9]+\]?"'

###############################################
# title
###############################################
function title {
  PROMPT_COMMAND="echo -ne \"\033]0;$1\007\""
}

###############################################
# aliases
###############################################
# basic aliases
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -alh'
alias cgrep='grep --color=always'
alias cegrep='egrep --color=always'
alias gk='gitk --all 2> /dev/null &'
alias gj='ps -ef | grep java | egrep -v "grep .* java"'

# general aliases
alias tidyx='tidy -qi -xml -wrap 1000'
alias grepr="grep -lr $'\r'"
alias greprv="egrep -v ':\r$'"
alias greprn="grep -nr $'\r'"
# note: grepbad -P is perl grep... works on linux, but not mac
alias grepbad="grep -r -P -n '[\x80-\xFF]'"
# MAC sed in-place strip \r line endings from files" 
alias sedir="sed -i '' $'s/\r$//g'"

##############################################
# HA aliases
##############################################
alias vpn='/opt/cisco/anyconnect/bin/vpn connect vpn.homeawaycorp.com'

# hash aliases 
# note: don't forget to use 'echo -n foo |', not 'echo foo', (to strip trailing \n) when placing password hashes into files. 
# alias md5='md5'
alias sha256='shasum -a 256'
alias sha256ossl='openssl dgst -sha256'

# HAPI aliases
alias hapitnetfilter='curl --user 'admins/hapiadmin:hapiadmin' http://devsvr13-hapi-service-test.wvrgroup.internal:8080/runtimeProps/restrictToNetworkFilter'

# SIF aliases
alias sifdnames='curl --user ssfdevadmin:ssfdevadmin --header "Accept: application/json" http://localhost:8085/configs/matchers/names'
alias siftnames='curl --user ssfdevadmin:ssfdevadmin --header "Accept: application/json" http://hapi-ssf-ustst1-02.wvrgroup.internal:8080/configs/matchers/names'
alias siftnames2='curl --user ssfdevadmin:ssfdevadmin --header "Accept: application/json" http://hapi-ssf-ustst1.wvrgroup.internal/configs/matchers/names'
alias sifsnames='curl --user ssfdevadmin:ssfdevadmin --header "Accept: application/json" http://hapi-ssf-usstg1.wvrgroup.internal/configs/matchers/names'
alias sifdenabled='curl --user ssfdevadmin:ssfdevadmin --header "Accept: application/json" http://localhost:8085/configs/matchers?enabled=true'
alias siftenabled='curl --user ssfdevadmin:ssfdevadmin --header "Accept: application/json" http://hapi-ssf-ustst1-02.wvrgroup.internal:8080/configs/matchers?enabled=true'
alias sifsenabled='curl --user ssfdevadmin:ssfdevadmin --header "Accept: application/json" http://hapi-ssf-usstg1-03.wvrgroup.internal:8080/configs/matchers?enabled=true'
# jpid on test/stage machines for opp services
alias jpidsif='ps -ef | grep "java" | egrep -v "grep" | egrep hapi-ssf | egrep --color "[a-zA-Z_\-]+.version"'
alias jpidhapi='ps -ef | grep "java" | egrep -v "grep" | egrep hapi_service | egrep --color "[a-zA-Z_\-]+.version"'
alias jpidepic='ps -ef | grep "java" | egrep -v "grep" | egrep epic | egrep --color "[a-zA-Z_\-]+.version"'
alias jpidtsar='ps -ef | grep "java" | egrep -v "grep" | egrep -i tsar | egrep --color "[a-zA-Z_\-]+.version"'

# misc. dev aliases
alias jpid='ps -E | grep --color "jetty:run" | egrep -v "grep.*jetty" | sed "s/\([0-9]*\).* PWD=\([A-Za-z0-9_/-]*\).*/\1  \2/"'
alias tfails='grep -Hr "Failures:" target/*-reports | grep -v "Failures: 0, Errors: 0" | egrep "((Failures: [1-9][0-9]*)|(Errors: [1-9][0-9]*))+"'
alias tskips='grep -Hr "Skipped:" target/*-reports | grep -v "Skipped: 0" | egrep "(Skipped: [1-9][0-9]*)"'
alias grepcoreapi='mvn dependency:resolve | grep ":api-client"; egrep -ri "(api-client|api-test)" src pom.xml | egrep -vi "(omapi-test|omapi-client)" | egrep -i "(api-client|api-test)"'
alias hadiskusers='du -ks /usr/local/homeaway/* | sort -n -r | head -n 20'

# function to look for java files where log variable isn't using the given file's classname
function badloggers {
  if [[ ! -z $1 ]]; then dir=$1; else dir=$(pwd); fi
  egrep -ir '(log|LOGGER)\s*=\s*Log' $dir/src --include=*.java | sed -e 's|\(.*/\)\(.*\)\.java.*(\(.*\)\.class.*).*|\2 \3|' | awk '{ if ($1 != $2) print $1".java != "$2".class" }'
}
function allbadloggers {
  if [[ -z "$1" ]]; then projlist=$(ls -1); else projlist="$@"; fi
  #echo "projs: $projlist"
  for d in $projlist; do 
    if [[ -d $d/src ]]; then echo -e "\n$d:"; badloggers $d; fi
  done
}
alias oppbadloggers='allbadloggers $(opp_projs.sh)'

# example mvn testng test
# mvn test -Dhit.profile=TEST [-Dit.test=SpaydsIT]
# mvn verify -Dhit.profile=local [-Dhit.useResin=true] [-Dhit.checkoutHapi=true]
# mvn verify -Dpit.profile=local [-Dit.test=EpicTest#testStatus404] [-Dmaven.failsafe.debug="$PIT_DEBUG"]

#################################################################
# maven options
#################################################################
#export MAVEN_OPTS_BASE="-Dfile.encoding=UTF-8"
#export MAVEN_OPTS_BASE="-Xms256m -Xmx1024m -XX:+CMSClassUnloadingEnabled -XX:PermSize=64M -XX:MaxPermSize=256M -Dfile.encoding=UTF-8"
export MAVEN_OPTS_BASE="-Xms256m -Xmx1024m -XX:+CMSClassUnloadingEnabled -XX:PermSize=64M -XX:MaxPermSize=256M"
export MAVEN_OPTS="$MAVEN_OPTS_BASE"

export HAPI_DEBUG="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=54000,server=y,suspend=y"
export EPIC_DEBUG="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=54001,server=y,suspend=y"
export WEB_DEBUG="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=54002,server=y,suspend=y"
export PIT_DEBUG="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=54003,server=y,suspend=y"

################################################################
# maven functions and aliases
################################################################
function mpd {
  mvn -Dplugin=$1 help:describe
}

function mt1 {
  mvn test -Dtest=$1
}

# mvn dev aliases
alias mclean='mvn clean'
alias mct='mvn clean test'
alias mcit='mvn clean integration-test'
alias mjr='mvn jetty:run'
alias mec='mvn eclipse:clean'
alias mrc='mvn release:clean'
alias mdt='mvn dependency:tree'
alias mdr='mvn dependency:resolve'
alias mdl='mvn dependency:list'
alias mcd='mvn clean deploy'
alias mcdst='mvn clean deploy -DskipTests=true'
alias mmbg='mvn mybatis-generator:generate'
alias mee='mvn eclipse:eclipse'
alias meds='mvn eclipse:eclipse -DdownloadSources=true'
alias medsjd='mvn eclipse:eclipse -DdownloadSources=true -DdownloadJavadocs=true'