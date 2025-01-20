
# from https://wiki.archlinux.org/title/Zsh#Key_bindings
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Ctrl-Up]="^[[1;5A"
key[Ctrl-Down]="^[[1;5B"
key[Ctrl-Left]="^[[1;5C"
key[Ctrl-Right]="^[[1;5D"

# setup key accordingly
[[ -n "${key[Home]}"        ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"         ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"      ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}"   ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"      ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"          ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"        ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"        ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"       ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"      ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"    ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"   ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Ctrl-Up]}"     ]] && bindkey -- "${key[Ctrl-Up]}"    up-line-or-history
[[ -n "${key[Ctrl-Down]}"   ]] && bindkey -- "${key[Ctrl-Down]}"  down-line-or-history
[[ -n "${key[Ctrl-Left]}"   ]] && bindkey -- "${key[Ctrl-Left]}"  forward-word
[[ -n "${key[Ctrl-Right]}"  ]] && bindkey -- "${key[Ctrl-Right]}" backward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "${key[Up]}" history-beginning-search-backward-end
bindkey "${key[Down]}" history-beginning-search-forward-end

eval $(dircolors ~/.dotfiles/.dir_colors)

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' '' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$HOME/.dotfiles/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_by_copy
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt extended_history

autoload -Uz bashcompinit
bashcompinit

# settings
WHEEL_LINES=8

# PATH
export PATH=$HOME/.local/bin:$HOME/bin:$PATH

# COMMON ENV VARS
if command -v nvim &> /dev/null; then
    export EDITOR=nvim
elif command -v vim &> /dev/null; then
    export EDITOR=vim
else
    export EDITOR=vi
fi
export LESS="--mouse --wheel-lines=$WHEEL_LINES -R"

# THEME
source ~/.dotfiles/powerlevel10k/powerlevel10k.zsh-theme

# PLUGNS
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/zsh-autosuggestions-0.7.1/zsh-autosuggestions.zsh

# NVIM config
if [ ! -d ~/.config/nvim-kick ]; then
    ln -s ~/.dotfiles/nvim-kick ~/.config/nvim-kick
fi
export NVIM_APPNAME=nvim-kick

# aliases
alias tma='tmux a'
alias nv='nvim'
alias ls='ls --color=auto'
alias l='ls -lAh'
alias ll='ls -lh'
alias ltr='ll -tr'
alias lt='ll =t'
alias la='ll -la'
alias lr='ll -r'
alias wo='cd /work'
alias aflow-readmeall="aflow --readme | awk '/readme/ {print \$2}' | sed 's/|.*//' | xargs -n 1 aflow"
alias rmlock='rm LOCK*'
alias sq='squeue -o"%16i %.8P %.30j %.3t %.12l %.12M %.12L %.4C %R" --me'
alias sqa='squeue -o"%16i %8u %.8P %.30j %.3t %.12l %.12M %.12L %.4C %R"'
alias sqp="squeue -o'%.8i %.10P %.24j %.3t %.22V %.22S %.4C %Y' --me --sort=S --states=PENDING"
alias grep="grep --color=auto"
alias grepc="grep --color=always"

function aflow-readme-search () {
	aflow --readme | awk '/readme/ {print $2}' | sed 's/|.*//' | xargs -I{} bash -c "echo {}; aflow {} | grep --color=auto $@"
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

# customize zsh p10k prompt
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

