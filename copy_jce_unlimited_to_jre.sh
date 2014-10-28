#!/bin/bash
###################################################################
# Script to copy the JCE unlimited strength jars to the JRE.
# Should be run as local admin account.
###################################################################

function add_dir_if_present {
  if [[ -e $2 && ! $1 =~ .*$2.* ]]; then
    echo "$1 $2"
  else
    echo "$1"
  fi
}

function copy_jce_jars {
  if [ ! -e $1 ]; then
    echo "ERROR: could not find JCE policy dir: $1"
    exit 1;
  fi

  sudo mkdir -p $2

  sudo cp -p $1/*.jar $2
}

#######################################################################
# variables
#######################################################################

#JCE_DOWNLOAD_DIR=~/Downloads/UnlimitedJCEPolicy
JCE_DOWNLOAD_DIR=~/archive/UnlimitedJCEPolicy
MAC_JRE_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
SEC_DIR="lib/security"

INSTALL_DIRS=""
INSTALL_DIRS=$(add_dir_if_present "$INSTALL_DIRS" "$MAC_JRE_HOME/$SEC_DIR")
INSTALL_DIRS=$(add_dir_if_present "$INSTALL_DIRS" "$JAVA_HOME/$SEC_DIR")
INSTALL_DIRS=$(add_dir_if_present "$INSTALL_DIRS" "$JAVA_HOME/jre/$SEC_DIR")
echo "JCE INSTALL_DIRS: "; for d in $INSTALL_DIRS; do echo $d; done;

###########################################
# actions
###########################################

for d in $INSTALL_DIRS; do
  copy_jce_jars $JCE_DOWNLOAD_DIR $d
done

