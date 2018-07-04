_j() {
    local datafile="${_J_DATA:-$HOME/.j}"

    if [ "$1" = "--add" ]; then
        shift
    fi

    if [[ $# -ge 1 ]]; then
        choice="$1"
    else
        dirs -v
        echo -n "? "
        read choice
    fi
    if [[ -n $choice ]]; then
        declare -i cnum="$choice"
        if [[ $cnum != $choice ]]; then #choice is not numeric
            choice=$(dirs -v | grep $choice | tail -1 | awk '{print $1}')
            cnum="$choice"
            if [[ -z $choice || $cnum != $choice ]]; then
                echo "$choice not found"
                return
            fi
        fi
        choice="+$choice"
    fi
    pushd $choice
}

alias ${_J_CMD:-j}='_j 2>&1'

[ "$_J_NO_PROMPT_COMMAND" ] || {
    # populate directory list. avoid clobbering other PROMPT_COMMANDs.
    grep "_j --add" <<< "$PROMPT_COMMAND" >/dev/null || {
        PROMPT_COMMAND="$PROMPT_COMMAND"$'\n''(_j --add "$(command pwd '$_J_RESOLVE_SYMLINKS' 2>/dev/null)" 2>/dev/null &);'
    }
}
