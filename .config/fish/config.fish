if status is-interactive
    # Install fisher when not installed
    not test -f ~/.config/fish/functions/fisher.fish && curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    # Commands to run in interactive sessions can go here
    ##############################
    # Aliases
    ##############################
    # use -a in cp by default to allow recursive copying
    alias cp='cp -a'

    # rm aliases
    alias rm='rm -i'
    alias rf='rm -rf'
    alias rd='rm -r'

    # always use -p in mkdir
    alias mkdir='mkdir -p'

    # use bat instead of cat
    if command -q bat
        alias cat='bat'
    else if command -q batcat
        alias cat='batcat'
    end

    # Check the presence of /opt/nvim-linux64/bin/nvim
    if [ -f /opt/nvim-linux64/bin/nvim ]
        alias nvim='/opt/nvim-linux64/bin/nvim'
    end

    # alias vi to neovim when available
    command -q nvim && alias vi='nvim'

    # initialize starship prompt
    [ -f ~/.config/starship.toml ] && command -q starship &>/dev/null && eval (starship init fish)
end
