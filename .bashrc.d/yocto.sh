#!/bin/bash
#
# Author    : Robin Riis
# Filename  : new_project.sh
# Created   : 2023-06-03
#
# Description:
# ------------
#   a script for creating a new or initiating a yocto project
#
# Exit codes:
# -----------
#    ___________________________
#   | 0 |        SUCCESS        |
#   | 1 |    dont run as root   |
#   | 2 | not in yocto root dir |
#   \---------------------------/
#

## define colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


function yocto_init_project() {
    ## description of how to use the script
    ## is printed if no arguments are sent
    USAGE="create a new or initiate a ${GREEN}yocto project{$NC}!
------------------------------
${CYAN}${FUNCNAME[0]} ${GREEN}<new_project_name>${NC}

and make sure you are in the yocto root folder!
thats it!"
    create=0

    ## in case some logging has to be done about who did what
    ## make sure its run as a normal user.
    if [ $EUID -eq 0 ]; then
        echo -e "Don't run this as root!"
        return 1
    fi

    ## make sure we are in top directory
    ## a simple check for the oe-init-build-env file
    if [ ! -f "oe-init-build-env" ]; then
        echo -e "you need to be at yocto top directory!"
        return 2
    fi

    ## argument with project name is needed
    if [[ $# -eq 0 ]]; then
        echo -e "$USAGE"
        return 0
    fi

    ## create project
    PROJECT_NAME=$1
    if [ -d $PROJECT_NAME ]; then
        echo "initiating project: ${PROJECT_NAME}.."
    else
        echo "start creating project: ${PROJECT_NAME}.."
        create=1
    fi
    source oe-init-build-env ${PROJECT_NAME} 2> /dev/null
    if [[ ${PWD##*/} == ${PROJECT_NAME} ]]; then
        if [ $create -eq 1 ]; then
            echo -e "Project: ${PROJECT_NAME} was created!"
        fi
        echo -e "${GREEN}[SUCCESS]${NC} Project ${PROJECT_NAME} is loaded!"
    else
        echo -e "${RED}[FAILURE]${NC} Could not load project ${PROJECT_NAME} :("
    fi
}

function yocto_get_images() {
    if [ ! -f "oe-init-build-env" ]; then
        echo -e "you need to be in yocto root directory."
        return 1
    fi
    ls -la meta*/recipes*/images/*bb
}
