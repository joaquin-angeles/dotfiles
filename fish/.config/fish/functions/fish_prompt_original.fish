function fish_prompt_original
    set -lx _tide_status $status
    _tide_pipestatus=$pipestatus if not set -e _tide_repaint
        jobs -q && jobs -p | count | read -lx _tide_jobs
        /usr/bin/fish -c "set _tide_pipestatus $_tide_pipestatus
set _tide_parent_dirs $_tide_parent_dirs
PATH=$(string escape "$PATH") CMD_DURATION=$CMD_DURATION fish_bind_mode=$fish_bind_mode set _tide_prompt_80864 (_tide_1_line_prompt)" &
        builtin disown

        command kill $_tide_last_pid 2>/dev/null
        set -g _tide_last_pid $last_pid
    end

    if set -q _tide_transient
        echo -n \e\[0J
        add_prefix= _tide_item_character
        echo -n '(B[m '
    else
        math $COLUMNS-(string length -V "$_tide_prompt_80864[1]$_tide_prompt_80864[2]")-29 | read -lx dist_btwn_sides
        string replace @PWD@ (_tide_pwd)  $_tide_prompt_80864[1]'(B[m '
    end
end
