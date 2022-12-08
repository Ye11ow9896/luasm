#!/bin/bash
source ./lib
set -e



######## Interfaces menu #########
main_menu() {
    echo -en          "    ${CYAN}|========================${NORMAL}{MAIN MENU}${CYAN}======================| \n"
    echo -en          "    ${CYAN}|                                                         | \n"
    echo -en          "    ${CYAN}|    ${GREEN}[${NORMAL}1 - INSTALL${GREEN}]     [${NORMAL}2 - UPDATE${GREEN}]     [${NORMAL}3 - DELETE${GREEN}]${CYAN}      | \n"
    echo -en          "    ${CYAN}|                                                         | \n"
    echo -en          "    ${CYAN}|                       ${RED}[${NORMAL}0 - EXIT${RED}]${CYAN}                        | \n"
    echo -en          "    ${NORMAL}+${CYAN}=========================================================${NORMAL}+ \n"
    if [ -z "$1" ]; then
        echo -en "\n    ${NORMAL}> Make a choise: "
    else 
        echo -en "\n    ${RED} $1"
        echo -en "\n    ${NORMAL}> Make a choise: "
    fi
    read userChoise

        case "${userChoise}" in 
    0) 
        choise "exit";;
    1) 
        choise "install_menu";;
    2)
        choise "update_menu";;
    3)
        choise "delete_menu";;
    *)
        choise "error" "main_menu";;
    esac
}


update_menu() {
    echo -en          "    ${CYAN}|=======================${NORMAL}{UPDATE MENU}${CYAN}=====================| \n"
    echo -en          "    ${CYAN}|                                                         | \n"
    echo -en          "    ${CYAN}|               ${GREEN}[${NORMAL}1 - UPDATE${GREEN}]       ${RED}[${NORMAL}0 - BACK${RED}]${CYAN}             | \n"
    echo -en          "    ${CYAN}|                                                         | \n"
    echo -en          "    ${NORMAL}+${CYAN}=========================================================${NORMAL}+ \n"
    echo -en "\n    > Make a choise: "
    read userChoise

        case "${userChoise}" in 
    0) 
        choise "back" "main_menu";;
    1) 
        choise "update_menu";;
    *)
        choise "error";;
    esac
}

update() {
    echo "update"
}

delete_menu() {
    menu_head
}

###### START ######
main_screen() {
    menu_head
    main_menu
}

main_screen
