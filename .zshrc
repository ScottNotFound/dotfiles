
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
zstyle :compinstall filename "$HOME/.zshrc"

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

autoload -Uz bashcompinit
bashcompinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# settings
WHEEL_LINES=8

# PATH
export PATH=$HOME/.local/bin:$HOME/bin:$PATH

# LESS
export LESS="--mouse --wheel-lines=$WHEEL_LINES -R"

# THEME
source ~/.dotfiles/powerlevel10k/powerlevel10k.zsh-theme

# PLUGNS
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias tma='tmux a'
alias ls='ls --color=auto'
alias l='ls -lah'
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
alias grepc="grep --color=always"

function aflow-readme-search () {
	aflow --readme | awk '/readme/ {print $2}' | sed 's/|.*//' | xargs -I{} bash -c "echo {}; aflow {} | grep --color=auto $@"
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

# customize zsh p10k prompt
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

