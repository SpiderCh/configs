if [[ `uname` == "Darwin" ]]; then
	export MOVAVI_SDK=$HOME/usr/SDK
	export MOVAVI_SDK_PKG=$HOME/usr/SDK_PKG
	launchctl setenv MOVAVI_SDK $MOVAVI_SDK
	launchctl setenv MOVAVI_SDK_PKG $MOVAVI_SDK_PKG
	export GLOG_v=100
	export GLOG_buflevel=-1
	export PATH="/usr/local/bin:$PATH"
	launchctl setenv GLOG_v ${GLOG_v}
	launchctl setenv GLOG_buflevel ${GLOG_buflevel}
	export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
fi

ZSH=$HOME/.oh-my-zsh

if [ -d "$ZSH" ]; then
	ZSH_THEME="gentoo"
	plugins=(git git-extras git-prompt zsh-syntax-highlighting)
	source $ZSH/oh-my-zsh.sh
fi

# Enabling nice color macros
autoload colors zsh/terminfo
colors
# Setting up PS1
# PS1 = [Date] User@Hostname CurrFolder >
if [[ `whoami` == "root" ]]; then
	PS1='%B[%D - %*]%b %F{red}%n %F{cyan}%~ >%f '
else
	PS1='%B%F{white}[%D - %*]%b %F{green}%n@%m%f %F{cyan}%~ >%f '
fi

HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100000
setopt appendhistory beep nomatch notify
setopt correctall
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

if [[ `uname` == 'Darwin' ]]; then
	alias ls='ls -GF'
	alias ll='ls -l'
	alias ldd='otool -L'
	alias lockS='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
	alias showF='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
	alias hideF='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
	alias lcl='launchctl'
	alias lcll='launchctl load'
	alias lclu='launchctl unload'
	alias xcodelist='xcodebuild -list'
	alias xcodetarget='xcodebuild -parallelizeTargets -jobs 8 -target'
	alias silent_build='egrep "^(/.+:[0-9+:[0-9]+:.(error|warning):|fatal|===)"'
elif [[ `uname` == "Linux" ]]; then
	alias ls='ls --color=auto -F'
	alias ll='ls -l'
fi
autoload -Uz compinit

typeset -A key

# Because zsh didn't read /etc/inputrc,
# put key bindings from there here

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# For Konsole
# See key settings for konsole
bindkey "\\E[2~" yank
bindkey "\\E[1~" beginning-of-line
bindkey "\\E[3~" delete-char
bindkey "\\E[4~" end-of-line
bindkey "\\E[5~" up-line-or-history
bindkey "\\E[6~" down-line-or-history

compinit -u
# End of lines added by compinstall
