#!/bin/bash
source ./lib
set -e

luasm_update() {
    if [ "$(is_new_version ${LUASM_DIR})" -eq "1" ]; then
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
            choise "error" "start_app";;
        esac
    else
        go_to_screen main
    fi
}

start_app() {
    clear
    menu_head
    if [ "$(check_connection)" -eq "1" ]; then
        luasm_update
    else
        go_to_screen main
    fi
}

start_app