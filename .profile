# Code Collab
#export CCOLLAB_SCRIPTS=$HOME/bin/ccollab-scripts
#export CCOLLAB_HOME=/Applications/ccollab_client//ccollab

#export PATH=/opt/local/bin:/opt/local/sbin:${PATH}:${HOME}/bin:${CCOLLAB_SCRIPTS}:${CCOLLAB_HOME}
export PATH=/opt/local/bin:/opt/local/sbin:${PATH}:${HOME}/bin:~/.npm

#Java
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'

# Jmeter
JMETER_HOME=/Users/kashorn/jmeter/apache-jmeter-4.0/bin

# Kafka
export CONFLUENT_HOME=$HOME/kafka-tools/confluent-5.0.0

# Maven
#export MAVEN_HOME="/bin/mvn/apache-maven-3.2.5"
#export MAVEN_OPTS=-Xmx1024m -XX:MaxPermSize=256m
export PATH=~/bin/mvn/apache-maven-3.6.1/bin:${JMETER_HOME}:${CONFLUENT_HOME}/bin:${PATH}
alias mvni='clear; mvn install'
alias mvnt='clear; mvn test'
alias mvnv='clear; mvn verify'
alias mvnci='clear; mvn clean install'
alias mvnct='clear; mvn clean test'
alias mvncv='clear; mvn clean verify'
alias mvncoverage='mvn jacoco:report'

# Android
export ANDROID_HOME=/Users/kashorn/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GRADLE_HOME/bin:$PATH

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Git
alias gits='clear; git status'
alias gitd='clear; git diff'
alias gitl='git log'
alias gitr='git remote -v'
alias gitb='git branch -v'
export GIT_SSH=/usr/bin/ssh

# AWS
export HOMEBREW_ARTIFACTORY_API_TOKEN=AKCp8igrDNFerC357m4422e4tmu7xB983QLPxJhKFcSMfoux2REvp8rc4jC8t9ncdmYCMFD8W
export HOMEBREW_ARTIFACTORY_API_USER=kashorn

# General
alias timestamp='date "+%Y-%m-%dT%H:%M:%S"'
alias zulu='date -u "+%Y-%m-%dT%H:%M:%SZ"'

portinfo() {
    lsof -i tcp:$1
}

portkill() {
    lsof -t -i tcp:$1 | xargs kill
}

java11
