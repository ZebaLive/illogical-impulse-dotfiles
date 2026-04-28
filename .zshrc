# Path configuration
export PATH="$HOME/.local/bin:$PATH"

# Oh-My-Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(git fzf colored-man-pages zsh-autosuggestions fast-syntax-highlighting)

# Load Oh-My-Zsh if available
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    source $ZSH/oh-my-zsh.sh
fi

# ===== ALIASES =====
alias vim=nvim
alias cat='bat --paging=never'
alias pcat='bat -p'
alias ls='eza --icons'
alias clear="printf '\033[2J\033[3J\033[1;1H'"
alias pamcan=pacman
alias q='qs -c ii'

# thefuck alias
if command -v thefuck &> /dev/null; then
    eval $(thefuck --alias)
fi

# ===== FZF CONFIGURATION =====
# Set up fzf key bindings and fuzzy completion
if command -v fzf &> /dev/null; then
    eval "$(fzf --zsh)"
fi

# Use fd instead of fzf default
if command -v fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
    
    # Use fd for path and directory completion
    _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
    }
    
    _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
    }
fi

# FZF preview settings
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
    local command=$1
    shift
    
    case "$command" in
        cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
    esac
}

# Load fzf-git if available
if [ -f ~/.fzf-git.sh/fzf-git.sh ]; then
    source ~/.fzf-git.sh/fzf-git.sh
fi

# ===== LOAD CUSTOM CONFIGURATIONS FROM zshrc.d =====
if [ -d ~/.config/zshrc.d ]; then
    for file in ~/.config/zshrc.d/*.{sh,zsh}; do
        [ -f "$file" ] && source "$file"
    done
fi

# ===== STARSHIP PROMPT =====
# Initialize starship (this should be near the end)
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# ===== ZOXIDE (better cd) — must be last =====
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi
