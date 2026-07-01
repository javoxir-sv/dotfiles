function fish_prompt
    set -l user_char '►'
    if fish_is_root_user
        set user_char '#'
    end

    echo (set_color yellow)$PWD (set_color purple)$user_char
end
