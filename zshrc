# ============================================================================
# OH-MY-ZSH CONFIGURATION
# ============================================================================

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Case-sensitive completion
CASE_SENSITIVE="true"

# Plugins
plugins=(
  git
  sudo
  safe-paste
  history-substring-search
  zsh-autosuggestions
  fzf-zsh-plugin
)

# Helper function to source files if they exist
maybe_source() { [[ -f "$1" ]] && source "$1" }

# Load Oh My Zsh
maybe_source $ZSH/oh-my-zsh.sh

# ============================================================================
# HISTORY CONFIGURATION
# ============================================================================

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# History options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# History substring search keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ============================================================================
# GIT PROMPT CUSTOMIZATION
# ============================================================================

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# ============================================================================
# ZSH OPTIONS
# ============================================================================

# Directory navigation
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Completion behavior
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

# Word characters
WORDCHARS='*?_-.[]~/&;!#$%^(){}<>'

# ============================================================================
# COMPLETION SETTINGS
# ============================================================================

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# ============================================================================
# NAVIGATION ALIASES
# ============================================================================

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias /='cd /'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'

# ============================================================================
# MODERN CLI TOOL REPLACEMENTS
# ============================================================================

# Core replacements (cargo install)
alias cat=bat
alias du=dust
alias find=fd
alias grep=rg
alias ps=procs
alias cd=z
alias ls='lsd -al'

# Utility aliases
alias p1='patch -p1 -g1 --dry-run'

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================

export EDITOR=vim
export VISUAL=vim
export PATH="$HOME/.cargo/bin:$PATH"

# ============================================================================
# TERMINAL INTEGRATION
# ============================================================================

# Tilix/VTE integration
if [[ $TILIX_ID ]] || [[ $VTE_VERSION ]]; then
  [ -r /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh
fi

# ============================================================================
# SYNTAX HIGHLIGHTING
# ============================================================================

maybe_source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
maybe_source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ============================================================================
# CUSTOM CONFIGURATIONS
# ============================================================================

maybe_source ~/.zzz_profile.sh
maybe_source ~/.bashrc.local

# ============================================================================
# INITIALIZE TOOLS
# ============================================================================

# Zoxide (smart cd replacement)
eval "$(zoxide init zsh)"
