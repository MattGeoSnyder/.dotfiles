# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Supress powerlevel9k instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

alias ls='ls --color'
if command -v  fdfind >/dev/null; then
	alias fd='fdfind'
fi

export PATH="$PATH:/home/mattgeosnyder/.local/bin"

#Keybindings for vicmd and emacs like insert mode
bindkey -v 
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^F' forward-char

bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history

bindkey -M viins -r '^R'

source /usr/share/doc/fzf/examples/key-bindings.zsh


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt extendedglob nomatch notify
unsetopt beep

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit ice depth=1 
zinit light fdellwing/zsh-bat 

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit light zdharma-continuum/fast-syntax-highlighting

zinit light zsh-users/zsh-autosuggestions

#completions
zstyle ':completion:*' menu-select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zinit light zsh-users/zsh-completions

zinit ice depth=1
zinit light marlonrichert/zsh-autocomplete
source $HOME/.local/share/zinit/plugins/marlonrichert---zsh-autocomplete/zsh-autocomplete.plugin.zsh
bindkey '^I' menu-select
bindkey -M menuselect '^N' menu-complete
bindkey -M menuselect '^P' reverse-menu-complete


autoload -Uz _zinit
autoload -Uz +X _gnu_generic

(( ${+_comps} )) && _comps[zinit]=_zinit

# bun completions
[ -s "/home/mattgeosnyder/.bun/_bun" ] && source "/home/mattgeosnyder/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

## Strips trailing ; before running a command for history
accept-line-strip-semicolon() {
	if [[ $BUFFER == *';' && $BUFFER != *';;'* ]]; then 
		BUFFER=${BUFFER%;}
	fi

	zle .accept-line 
}
zle -N accept-line-strip-semicolon

bindkey -M vicmd '^M' accept-line-strip-semicolon

bindkey '^M' accept-line-strip-semicolon
