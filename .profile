# Code Collab
#export CCOLLAB_SCRIPTS=$HOME/bin/ccollab-scripts
#export CCOLLAB_HOME=/Applications/ccollab_client//ccollab

#export PATH=/opt/local/bin:/opt/local/sbin:${PATH}:${HOME}/bin:${CCOLLAB_SCRIPTS}:${CCOLLAB_HOME}
export PATH=/opt/local/bin:/opt/local/sbin:${PATH}:${HOME}/bin:~/.npm

#Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home/
#export JAVA_HOME=/usr/bin/java
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'

JMETER_HOME=/Users/kashorn/jmeter/apache-jmeter-4.0/bin
export CONFLUENT_HOME=$HOME/kafka-tools/confluent-5.0.0

#export MAVEN_HOME="/bin/mvn/apache-maven-3.2.5"
#export MAVEN_OPTS=-Xmx1024m -XX:MaxPermSize=256m
export PATH=~/bin/mvn/apache-maven-3.6.1/bin:${JMETER_HOME}:${CONFLUENT_HOME}/bin:${PATH}

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"


alias mvni='clear; mvn install'
alias mvnt='clear; mvn test'
alias mvnv='clear; mvn verify'
alias mvnci='clear; mvn clean install'
alias mvnct='clear; mvn clean test'
alias mvncv='clear; mvn clean verify'
alias mvncoverage='mvn jacoco:report'

# Git
alias gits='clear; git status'
alias gitd='clear; git diff'
alias gitl='git log'
alias gitr='git remote -v'
alias gitb='git branch -v'

alias timestamp='date "+%Y-%m-%dT%H:%M:%S"'
alias zulu='date -u "+%Y-%m-%dT%H:%M:%SZ"'

export GIT_SSH=/usr/bin/ssh

java8
