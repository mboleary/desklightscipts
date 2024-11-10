#!/bin/bash

CONFIG_PATH="${HOME}/.config/desklightconf"

if [[ -n $DESK_LIGHT_CONFIG_PATH ]]; then
    CONFIG_PATH=$DESK_LIGHT_CONFIG_PATH
fi

if [ ! -f $CONFIG_PATH ]; then
    echo "Config file could not be found at $CONFIG_PATH"
    exit 1
fi

set -a
source $CONFIG_PATH
set +a

echo "light ip is $LIGHT_IP"

help () {
    echo "Usage:\
$1 [-t|--turn <on|off>] [-r|--red <value>] [-g|--green <value>] [-b|--blue <value>]

Sets the state of the desk light. Config file can be found at ~/.config/desklightconf or can be overridden by setting \$DESK_LIGHT_CONFIG_PATH
    "
}

STATE=""
RED=""
GREEN=""
BLUE=""
WHITE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--turn)
            STATE="$2"
            # Shift args array past arg and value
            shift
            shift
            ;;
        -r|--red)
            RED="$2"
            # Shift args array past arg and value
            shift
            shift
            ;;
        -g|--green)
            GREEN="$2"
            # Shift args array past arg and value
            shift
            shift
            ;;
        -b|--blue)
            BLUE="$2"
            # Shift args array past arg and value
            shift
            shift
            ;;
        -w|--white)
            WHITE="$2"
            # Shift args array past arg and value
            shift
            shift
            ;;
        -h|--help)
            help
            exit 1
            ;;
        -*|--*)
            echo "Unknown option $1"
            help
            exit 1
            ;;
    esac
done

QUERY_PARAM_STRING=""

if [[ -n $STATE ]]; then
    QUERY_PARAM_STRING+="turn=$STATE&"
fi

if [[ -n $RED ]]; then
    QUERY_PARAM_STRING+="red=$RED&"
fi

if [[ -n $GREEN ]]; then
    QUERY_PARAM_STRING+="green=$GREEN&"
fi

if [[ -n $BLUE ]]; then
    QUERY_PARAM_STRING+="blue=$BLUE&"
fi

curl "$LIGHT_IP/color/0?$QUERY_PARAM_STRING"

