# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# 
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX1="%{$reset_color%}::[%{$fg[blue]%}"
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}]"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# SVN info
local svn_info='$(svn_prompt_info)'
ZSH_THEME_SVN_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}svn${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_SVN_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_SVN_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_SVN_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [[ "$(hg config oh-my-zsh.hide-dirty 2>/dev/null)" != "1" ]]; then
			if [ -n "$(hg status 2>/dev/null)" ]; then
				echo -n "$YS_VCS_PROMPT_DIRTY"
			else
				echo -n "$YS_VCS_PROMPT_CLEAN"
			fi
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

# Virtualenv
local venv_info='$(virtenv_prompt)'
YS_THEME_VIRTUALENV_PROMPT_PREFIX=" %{$fg[green]%}"
YS_THEME_VIRTUALENV_PROMPT_SUFFIX=" %{$reset_color%}%"
virtenv_prompt() {
	[[ -n "${VIRTUAL_ENV:-}" ]] || return
	echo "${YS_THEME_VIRTUALENV_PROMPT_PREFIX}${VIRTUAL_ENV:t}${YS_THEME_VIRTUALENV_PROMPT_SUFFIX}"
}

# conda env
local conda_info='$(condaenv_prompt)'
YS_THEME_CONDAENV_PROMPT_PREFIX=" %{$fg[green]%}"
YS_THEME_CONDAENV_PROMPT_SUFFIX=" %{$reset_color%}%"
condaenv_prompt() {
	[[ -n "${CONDA_DEFAULT_ENV:-}" ]] || return
	echo "${YS_THEME_CONDAENV_PROMPT_PREFIX}c(${CONDA_DEFAULT_ENV:t})${YS_THEME_CONDAENV_PROMPT_SUFFIX}"
}

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# Prompt format:
#
# PRIVILEGES USER @ MACHINE in DIRECTORY on git:BRANCH STATE [TIME] C:LAST_EXIT_CODE
# $ COMMAND
#
# For example:
#
# % ys @ ys-mbp in ~/.oh-my-zsh on git:master x [21:47:42] C:0
# $
#
function ys_prompt_jobid() {
	if [[ -n $LSB_JOBID ]]; then
		JOBID=$LSB_JOBID
	fi
	if [[ -n $SLURM_JOBID ]]; then
		JOBID=$SLURM_JOBID
	fi
	if [[ -n $PBS_JOBID ]]; then
		JOBID=$PBS_JOBID
	fi
	echo -n "${JOBID:+(#$JOBID)}"
}
function ys_cluster_name() {
	if [[ -n $SYSTEMNAME ]]; then
		echo -n "$SYSTEMNAME // "
	fi
}

local user_name="${USER_SHORT-${USER}}"

PROMPT="
%{$terminfo[bold]$FG[030]%}#%{$reset_color%}\
%(#,%{$bg[yellow]%}%{$fg[black]%}${user_name}%{$reset_color%},%{$fg[cyan]%}${user_name})\
%{$reset_color%}@\
%{$fg[green]%}$(ys_cluster_name)%m\
%{$fg[blue]%}$(ys_prompt_jobid)\
%{$reset_color%}:\
%{$terminfo[bold]$FG[228]%}%~%{$reset_color%}\
${hg_info}\
${git_info}\
${svn_info}\
${venv_info}\
${conda_info}\
 \
[%*] $exit_code
%{$terminfo[bold]$FG[146]%}$ %{$reset_color%}"
