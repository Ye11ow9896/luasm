#!/bin/bash
source ./lib
set -e

luasm_update() {
    echo -en "\n    > ${YELLOW}Update LUASM software to latest version? (${GREEN}Y${NORMAL}/${RED}N${YELLOW}): "
    read yn
        case "${yn}" in
    y|Y|yes)
        cd /${HOME}/${LUASM_DIR}
        git pull
        clear
        echo -en "     ${GREEN}LUASM software successfully updated! \n"
        go_to_screen main;;  
    n|N|no)
        choise "back" "main";;
    *)
        clear
        choise "error" "start_app";;
    esac
}

start_app() {
    if [ "$(check_connection)" -eq "1" ]; then
        if [ "$(is_new_version ${LUASM_DIR})" -eq "1" ]; then
            luasm_update
        else
            clear
            go_to_screen main
        fi
    else
        clear
        go_to_screen main
    fi
}

#clear
#menu_head
#start_app
go_to_screen main