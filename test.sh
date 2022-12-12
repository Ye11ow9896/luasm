#!/bin/bash
source ./lib

#
#Get_my_path=`pwd`
#SETUP_FOLDER_NAME=`grep "setup_folder_name" doup.conf.txt | cut -d ' ' -f 2`
#SETUP_PATH=`grep "setup_path" doup.conf.txt | cut -d ' ' -f 2`
#REPO_PATH=`grep "repo_path" doup.conf.txt | cut -d ' ' -f 2`
#
#echo -en "${SETUP_FOLDER_NAME} \n"
#echo -en "${SETUP_PATH} \n"
#echo -en "${REPO_PATH} \n"
#mkdir ${SETUP_FOLDER_NAME}
#cd ${SETUP_FOLDER_NAME}
#mkdir lol

#cd /home/${USER}/${SETUP_FOLDER_NAME}/${UPDATE_REPO_NAME};
#git fetch origin
#stat=`git status`
#origin=$(git rev-parse --short=8 origin/master)
#head=$(git rev-parse --short=8 HEAD)
#echo "${stat}"
#echo "${origin}"
#echo "${head}"
#if [ "${origin}" != "${head}" ]; then
#    echo "ne ravni"
#else
#    echo "ravni"
##fi
#
#install() {
#    cd /${HOME}
#    # create temp folder
#    c_folder=$(is_folder_created $2)
#    if [ "$c_folder" -eq "1" ]; then
#        rm -rf $2;
#    fi
#    mkdir $2;
#    cd $2;
#    git clone $1;
#    rm -rf /${HOME}/fluidd/*
#    cp -r /${HOME}/${FLUIDD_SRC_FOLDER}/Fluidd/dist/* /${HOME}/fluidd
#    rm -rf /${HOME}/${FLUIDD_SRC_FOLDER}
#}
#
#install ${FLUIDD_REPO} ${FLUIDD_SRC_FOLDER} ${FLUIDD_DIR}
#

update() {
    cd /${HOME}
    # create temp folder
    c_folder=$(is_folder_created "temp")
    if [ "$c_folder" -eq "1" ]; then
        rm -rf temp;
    fi
    mkdir temp;
    mkdir $2
    cd temp;
    git clone $1;
    cp -r /${HOME}/temp/Fluidd/dist/* /${HOME}/$2
    cp -r /${HOME}/temp/Fluidd/.git /${HOME}/$2
    rm -rf /${HOME}/temp
}

update ${FLUIDD_REPO} ${FLUIDD_DIR}