if status is-interactive
    # check if lsd is installed
    if command -q lsd
        alias l='lsd --icon=never'
        alias ls='lsd'
    end

    # use bat instead of cat
    if command -q bat
        alias cat='bat'
    else if command -q batcat
        alias cat='batcat'
    end

    # Use fastfetch instead of neofetch
    if command -q fastfetch
        alias neofetch='fastfetch'
    end
end

