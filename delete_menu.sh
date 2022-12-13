#!/bin/bash
source ./lib
set -e

delete_menu() {
    echo -en          "    ${CYAN}|======================${NORMAL}{DELETE MENU}${CYAN}=====================| \n"
    echo -en          "    ${CYAN}|                                                         | \n"
    echo -en          "    ${CYAN}|               ${GREEN}[${NORMAL}1 - DELETE${GREEN}]       ${RED}[${NORMAL}0 - BACK${RED}]${CYAN}             | \n"
    echo -en          "    ${CYAN}|                                                         | \n"
    echo -en          "    ${NORMAL}+${CYAN}=========================================================${NORMAL}+ \n"
    echo -en "\n    > Make a choise: "
    read userChoise

        case "${userChoise}" in 
    0) 
        choise "back" "main";;
    1) 
        choise "delete";;
    *)
        choise "error" "delete_menu";;
    esac
}

delete() {
    echo -en "\n    > Are you sure to delete Larets3d software? (${RED}Y${NORMAL}/${GREEN}N): "
    read yn
        case "${yn}" in
    y|Y|yes)
        delete_all;;   
    n|N|no)
        choise "back" "delete_menu";;
    *)
        choise "error" "delete_menu";;
    esac
}

delete_all() {
    cd /${HOME}
    if [ "$(is_folder_created ${KLIPPER_DIR})" -eq "1" ] && [ "$(is_folder_created ${KSCREEN_DIR})" -eq "1" ] && [ "$(is_folder_created ${FLUIDD_DIR})" -eq "1" ]
    then
        delete_app ${KLIPPER_DIR}
        delete_app ${KSCREEN_DIR}
        delete_app ${FLUIDD_DIR}
        #clear
        echo -en "     ${GREEN}Larets3D software successfully deleted! \n"
        go_to_screen main
    else
        #clear
        echo -en "     ${GREEN}Larets3D software not installed! \n"
        go_to_screen main
    fi

}

delete_app() {
    if [ "$(is_folder_created $1)" -eq "1" ]; then
        rm -rf /${HOME}/$1
    fi
}



menu_head
delete_menu