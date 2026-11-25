# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Supress powerlevel9k instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Colored ls
alias ls='ls --color'

# fd command alias
if command -v fd >/dev/null; then
	alias find='fd'

  fd_ignore="${XDG_CONFIG_HOME:-$HOME/.config}/fd/ignore"
  [[ -f $fd_ignore ]] || { mkdir -p ${fd_ignore:h} && print '.git/' > $fd_ignore }
fi

# interactive pacman install
ipac() {
	pacman -Slq | fzf --multi --query="$*" --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}

# Path
typeset -U path
export PATH="$PATH:/home/mattgeosnyder/.local/bin:/opt/nvim/:/home/mattgeosnyder/.cargo/bin"

# Keybind mode
bindkey -e

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt extendedglob nomatch notify
unsetopt beep

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
	command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" &&
		print -P "%F{33} %F{34}Installation successful.%f%b" ||
		print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# Zinit packages
# =========================================================
# Autocomplete config
# ---------------------------------------------------------
zinit light zsh-users/zsh-completions

zinit ice depth=1
zinit light marlonrichert/zsh-autocomplete


zstyle ':completion:*' menu-select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zstyle ':autocomplete:*' add-semicolon no
bindkey -M menuselect '^M' .accept-line

zstyle ':autocomplete:*' min-input 0
zstyle ':autocomplete:*' delay 0.1
# ---------------------------------------------------------
zinit ice depth=1
zinit light fdellwing/zsh-bat

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit light zdharma-continuum/fast-syntax-highlighting

zinit light zsh-users/zsh-autosuggestions
# =========================================================

# Fuzzy finder
# ---------------------------------------------------------
source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_CTRL_T_COMMNAD="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
# ---------------------------------------------------------------------------------------------

((${+functions[compdef]})) && compdef _zinit zinit

# bun completions
[ -s "/home/mattgeosnyder/.bun/_bun" ] && source "/home/mattgeosnyder/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
