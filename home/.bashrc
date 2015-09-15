export PATH=$PATH:"/usr/local/lib64"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib64"

# pkgconfig path
export PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[0;37m\]$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] '
