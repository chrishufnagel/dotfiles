# History
HISTSIZE=10000
SAVEHIST=10000

# Basic prompt
PROMPT='%n@%m %~ %# '

export EDITOR=nvim
export VISUAL=nvim

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
