# Commands to run in interactive sessions can go here
if status is-interactive
    # Install fisher when not installed
    if not test -f ~/.config/fish/functions/fisher.fish
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 
        fisher install jorgebucaran/fisher edc/bass
    end

    # Check the presence of /opt/nvim-linux64/bin/nvim
    [ -f /opt/nvim-linux64/bin/nvim ] && set -xp PATH /opt/nvim-linux64/bin/nvim

    # initialize starship prompt
    [ -f ~/.config/starship.toml ] && command -q starship && eval (starship init fish)
end
