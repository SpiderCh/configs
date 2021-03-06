# Lines configured by zsh-newuser-install
#
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"

plugins=(git git-extras svn mercurial zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Enabling nice color macros
autoload colors zsh/terminfo
colors
# Setting up PS1
# PS1 = [Date] User@Hostname CurrFolder >
PS1='%B[%D - %*]%b %F{red}%n %F{cyan}%~ >%f '

HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100000
setopt appendhistory beep nomatch notify
setopt correctall
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/root/.zshrc'

autoload -U colors && colors
alias ls='ls --color=auto'
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

compinit
# End of lines added by compinstall