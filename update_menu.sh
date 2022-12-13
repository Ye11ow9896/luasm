#!/bin/bash
source ./lib
set -e

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
        choise "back" "main";;
    1) 
        choise "update";;
    *)
        choise "error" "update_menu";;
    esac
}

update() {
    c_con=$(check_connection)
    if [ "$c_con" -eq "0" ]; then # check inet connection
        clear
        echo -en "     ${RED}No Internet connection! \n"
        go_to_screen main 
    elif [ "$c_con" -eq "1" ]; then
        update_app
    fi
}

update_app() {
    count="0"
    # go to main user folder
    cd /home/$USER; 
    # check all folders
    if [ "$(is_folder_created ${KLIPPER_DIR})" -eq "1" ] && [ "$(is_folder_created ${KSCREEN_DIR})" -eq "1" ] && [ "$(is_folder_created ${FLUIDD_DIR})" -eq "1" ]
    then 
        if [ "$(is_new_version ${KLIPPER_DIR})" -eq "1" ] && [ "$(is_new_version ${KSCREEN_DIR})" -eq "1" ] && [ "$(is_new_version ${FLUIDD_DIR})" -eq "1" ]
        then
            # all folders with apps are exists
            update_software ${KLIPPER_DIR}
            update_software ${KSCREEN_DIR}
            update_software ${FLUIDD_REPO} ${FLUIDD_DIR}
            #clear
            echo -en "     ${GREEN}Larets3D software successfully updated! \n"
            go_to_screen main
        else
            #clear
            echo -en "     ${GREEN}You have already lestest version! \n"
            go_to_screen main    
        fi        
    else  
        #clear
        echo -en "     ${GREEN}Larets3D software not installed! \n"
        go_to_screen main
    fi 
}

update_software() {

    if [ "$(is_new_version $1)" -eq "1" ]; then
        if [ -z $2 ]; then
            # update klipper and klipperScreen
            cd /${HOME}/$1
            git pull
        else 
            # update Fluidd
            c_folder=$(is_folder_created "temp")
            if [ "$(is_folder_created "temp")" -eq "1" ]; then
                rm -rf /${HOME}/temp;
            fi
            mkdir temp;
            mkdir $2
            cd temp;
            git clone $1;
            cp -r /${HOME}/temp/Fluidd/dist/* /${HOME}/$2
            cp -r /${HOME}/temp/Fluidd/.git /${HOME}/$2
            rm -rf /${HOME}/temp
        fi
    else 
        echo -en "${GREEN}$1 has lastest version!"
    fi
}


menu_head
update_menu