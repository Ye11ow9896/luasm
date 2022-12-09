#!/bin/bash
source ./lib
set -e

install_menu() {
    echo -en          "    ${CYAN}|======================${NORMAL}{INSTALL MENU}${CYAN}=====================| \n"
    echo -en          "    ${CYAN}|                                                         | \n"
    echo -en          "    ${CYAN}|               ${GREEN}[${NORMAL}1 - INSTALL${GREEN}]      ${RED}[${NORMAL}0 - BACK${RED}]${CYAN}             | \n"
    echo -en          "    ${CYAN}|                                                         | \n"
    echo -en          "    ${NORMAL}+${CYAN}=========================================================${NORMAL}+ \n"
    echo -en "\n    > Make a choise: "
    read userChoise

        case "${userChoise}" in 
    0) 
        choise "back" "main";;
    1) 
        choise "install";;
    *)
        choise "error" "install_menu";;
    esac
}

install() {
    c_con=$(check_connection)
    if [ "$c_con" -eq "0" ]; then # check inet connection
        clear
        echo -en "     ${RED}No Internet connection! \n"
        go_to_screen main 
    elif [ "$c_con" -eq "1" ]; then
        install_app
    fi
}

install_app() {
    count="0"
    # go to main user folder
    cd /home/$USER; 
    # check all folders
    if [ "$(is_folder_created ${KLIPPER_DIR})" -eq "1" ] && [ "$(is_folder_created ${KSCREEN_DIR})" -eq "1" ] && [ "$(is_folder_created ${FLUIDD_DIR})" -eq "1" ]
    then 
        clear
        echo -en "     ${GREEN}Larets3D software already installed! \n"
        go_to_screen main
    else  
        install_software ${KLIPPER_REPO}
        install_software ${KSCREEN_REPO}
        install_software ${FLUIDD_REPO} ${FLUIDD_DIR}
    fi 
}

install_software() {
    cd /${HOME}
    if [ -z $2 ]; then  #setup klipper and klipperScreen
        git clone $1
    else                # setup fluidd
        cd /${HOME}
        # create temp folder
        c_folder=$(is_folder_created "temp")
        if [ "$c_folder" -eq "1"]; then
            rm -rf temp;
        fi
        mkdir temp;
        mkdir $2
        cd temp;
        git clone $1;
        cp -r /${HOME}/temp/Fluidd/dist/* /${HOME}/$2
        rm -rf /${HOME}/temp
    fi
}

menu_head
install_menu
