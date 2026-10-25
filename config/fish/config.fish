# Fish config

# Remove greeting
set -g fish_greeting ""

# Add a line between prompts
set -g __starship_first_prompt 1

function __starship_newline --on-event fish_prompt
    if test "$__starship_first_prompt" = "1"
        set -g __starship_first_prompt 0
    else
        echo
    end
end

function clear
    command clear $argv
    set -g __starship_first_prompt 1
end