#!/bin/bash
HOMEPATH="$(dirname $0)"
git submodule init

# ================== < General  Functions > ================== #
is_installed_(){
 if ! which $1 &>/dev/null; then
   echo "[❎] Error: $1 is not installed"
   apt install $1
    exit 1
 fi
}


#=====================# Coloured Text_Installer #=====================#
coloured_text_installer(){
#=====================# bfs #=====================#
if ! which j0find &>/dev/null; then
 cd "$HOMEPATH/j0find"
  if [ ! -f j0find.h ];then
   cp -a bfs.h j0find.h
  fi
   for i in $(find "$HOMEPATH/j0find" -type f)
    do
     sed -i 's/bfs/j0find/g' $i
    done
 make
 cp j0find /sbin
 chmod +x /sbin/j0find
fi
#=============# Coloured man pages #=============#
if [ -f /etc/bash.bashrc ];then
 if  ! [ grep LESS_TERMCAP /etc/bash.bashrc ];then
  cat << EOF >> /etc/bash.bashrc
  # Coloured man pages
   export LESS_TERMCAP_mb=$'\e[1;32m'
   export LESS_TERMCAP_md=$'\e[1;32m'
   export LESS_TERMCAP_me=$'\e[0m'
   export LESS_TERMCAP_se=$'\e[0m'
   export LESS_TERMCAP_so=$'\e[01;33m'
   export LESS_TERMCAP_ue=$'\e[0m'
   export LESS_TERMCAP_us=$'\e[1;4;31m'
  EOF
   # Coloured man pages alternative with package "most"(Supports multiple windows and can scroll left and right.)
    #export PAGER="most"
 fi
fi
#=============# Cheat #=============#
which cheat &>/dev/null || pip install cheat

 if  ! [ grep CHEATPATCH /etc/bash.bashrc ];then
 cat << EOF >> /etc/bash.bashrc
  #Default Cheat dir
   export DEFAULT_CHEAT_DIR='$HOME/.cheat'
#  #Cheat settings
#   export CHEATPATH='$HOME/.cheat'
#  #Multiple dirs to your CHEATPATH:
#   export CHEATPATH="$CHEATPATH:$HOME/.cheat"
  #Syntax highlighting
   export CHEATCOLORS=true
  #Cheat text editor
   export CHEAT_EDITOR='nano'
 EOF
#=============# Coloured prompt #=============#
}

coloured_text_installer

#to be continued...
