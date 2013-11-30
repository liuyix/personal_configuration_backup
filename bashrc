#
# ~/.bashrc
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#最原始的PS1
#PS1='[\u@\h \W]\$ '
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
##############################################
# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -ahlFt --time-style=long-iso'
alias la='ls -A'
#alias l='ls -CF'
#把rm改掉了
#alias rm='mv --target-directory=/home/liuyix/.Trash'
alias m5term="m5term 127.0.0.1 3456"
alias wget="wget --no-check-certificate"
######################################################


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
# 可以将alias单独放到一个脚本里面(.bash_aliases)，之后source进来
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
##################################
alias rm='rm -I'
alias ls='ls -hFt --color=auto'
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#设置自动补全
complete -cf sudo
complete -cf man
complete -cf info



HOST_AWK=/usr/bin/gawk
NDK_HOME=/home/cnliuyix/android-ndk-r7
export JAVA_HOME=/home/liuyix/lib/jdk
export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib/tools.jar:~/algs4/stdlib.jar
export PATH=$PATH:$JAVA_HOME/bin:/home/liuyix/bin
export NDKINC=$NDK_HOME/platforms/android-9/arch-arm/usr/include
export m5=/home/liuyix/Dev/eclipse_workspace/gem5
export M5_PATH=/home/liuyix/Dev/gem5/gem5_system
export Proxy=http://127.0.0.1:8087
export EDITOR="vim"
export ALTERNATE_EDITOR='emacs --daemon; emacsclient -c'
export Ssh932="liuyix@10.108.13.136"
export Ssh932home=$Ssh932:/home/liuyix
export Pinroot=/home/liuyix/lib/pin
export Ssh933="liuyix@10.108.12.227"
export SshArch="liuyix@10.108.12.16"
export Sshz=liuyix@10.108.12.158

ulimit -c unlimited

export PATH=~/adt-bundle-linux-x86_64-20130717/sdk/platform-tools/:$PATH
export PATH=~/android_toolchain/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/Dev/galaxys2_kernel_repack-i9100-ics/:$PATH
export PATH=~/Dev/LBE_Root/root_firmware_script/extract-bootimg/:$PATH
export PATH=$HOME/.rvm/bin/:$PATH # Add RVM to PATH for scripting
export PATH=/home/liuyix/bin:$PATH
export PATH=$HOME/android/adt-bundle/sdk/platform-tools:$PATH
export box=10.108.12.107
