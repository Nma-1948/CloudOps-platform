#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# SERVICE STATUS
#
# Purpose:
#   Displays the current status of the AI API service.
#
# Information Displayed:
#   - Service status
#   - Process ID
#   - CPU usage
#   - Memory usage
#   - Listening port
#   - API health
#   - Model status
#
# ==========================================================

# ----------------------------------------------------------
# LOAD SHARED LIBRARIES
# ----------------------------------------------------------

APP_DIR="$HOME/ai-devops-classifier"

source "$APP_DIR/scripts/utils/colors.sh"
source "$APP_DIR/scripts/utils/config.sh"
source "$APP_DIR/scripts/utils/logger.sh"
source "$APP_DIR/scripts/utils/banner.sh"
source "$APP_DIR/scripts/utils/process.sh"
source "$APP_DIR/scripts/utils/validation.sh"

# ----------------------------------------------------------
# DISPLAY SERVICE STATUS
# ----------------------------------------------------------

show_status() {

    echo
    echo "=============================="
    echo " Service Information"
    echo "=============================="

    if is_running
    then
        PID=$(get_pid)

        echo -e "${GREEN}Status : RUNNING${NC}"
        echo "PID    : $PID"

        echo
        echo "CPU / MEMORY"

        ps -p "$PID" -o %cpu,%mem,rss,etime,cmd

    else

        echo -e "${RED}Status : STOPPED${NC}"

    fi

}

# ----------------------------------------------------------
# DISPLAY NETWORK STATUS
# ----------------------------------------------------------

show_network() {

    echo
    echo "=============================="
    echo " Network"
    echo "=============================="

    ss -tulpn | grep "$PORT" || echo "Port $PORT is not listening."

}

# ----------------------------------------------------------
# HEALTH CHECK
# ----------------------------------------------------------

show_health() {

    echo
    echo "=============================="
    echo " Health Check"
    echo "=============================="

    if curl -s "$HEALTH_URL" >/dev/null
    then
        echo -e "${GREEN}API : HEALTHY${NC}"
    else
        echo -e "${RED}API : UNREACHABLE${NC}"
    fi

}

# ----------------------------------------------------------
# MODEL STATUS
# ----------------------------------------------------------

show_model() {

    echo
    echo "=============================="
    echo " AI Model"
    echo "=============================="

    if validate_model
    then
        echo -e "${GREEN}Model : AVAILABLE${NC}"
    else
        echo -e "${RED}Model : MISSING${NC}"
    fi

}

# ----------------------------------------------------------
# MAIN PROGRAM
# ----------------------------------------------------------

main() {

    show_banner "Service Status"

    show_status

    show_network

    show_health

    show_model

}

main

