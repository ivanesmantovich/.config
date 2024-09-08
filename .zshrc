autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' (%b)'


alias vi='nvim'

alias fzfn='nano ''$(fzf)'
alias fzfe='open -a TextEdit ''$(fzf)'
alias edit='open -a TextEdit'

export EDITOR="nvim"
export VISUAL="nvim"

alias lg="lazygit"

alias ll="eza -al --group-directories-first"

PROMPT='%F{blue}%n%f on %m at %B%~%b${vcs_info_msg_0_}: '

export PATH="$HOME/.config/dotfiles/bin:$PATH"

function lk {
  cd "$(walk "$@")"
}

eval "$(zoxide init zsh)"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=252"

eval "$(fnm env)"
