#!/bin/bash

ENABLE_FILE=false
ENABLE_STDOUT=false
LOG_FILE="/tmp/scripts.log"

BRIGHT=$(tput bold)
CYAN=6
GREEN=82
NORMAL=$(tput sgr0)
RED=1
YELLOW=3

ERROR="ERROR"
INFO="INFO"
SUCCESS="SUCCESS"
WARNING="WARNING"

info() {
	write "$1" $CYAN $INFO $2
}

warn() {
	write "$1" $YELLOW $WARNING $2
}

error() {
	write "$1" $RED $ERROR $2
}

success() {
	write "$1" $GREEN $SUCCESS $2
}

write() {
	message=$1
	color=$2
	type=$3
	force_writing=${4:-false}
	date_log=$(date "+%d/%m/%Y %H:%M:%S.%3N")

	if [ "$DEBUG" == "true" ] || [ "$force_writing" == "true" ]
	then	
		echo "[$date_log][$type] - $message" >> $LOG_FILE
	fi

	if [ $ENABLE_STDOUT == "true" ]
	then	
		tput setaf $color

		echo "${BRIGHT}[$date_log][$type]${NORMAL} - $message"
	fi
}