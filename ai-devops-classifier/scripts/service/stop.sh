#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# STOP SERVICE
#
# Purpose:
#   Stops the AI API service.
#
# Workflow:
#   1. Display banner
#   2. Verify service is running
#   3. Stop service
#   4. Verify shutdown
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

# ----------------------------------------------------------
# STOP SERVICE
# ----------------------------------------------------------

stop_service() {

    if ! is_running
    then
        echo -e "${YELLOW}[INFO] AI service is already stopped.${NC}"
        log_message "INFO" "Stop requested but service was not running."
        exit 0
    fi

    echo -e "${BLUE}[INFO] Stopping AI service...${NC}"

    stop_process

}

# ----------------------------------------------------------
# VERIFY SHUTDOWN
# ----------------------------------------------------------

verify_shutdown() {

    sleep 2

    if is_running
    then
        echo -e "${RED}[ERROR] Failed to stop AI service.${NC}"
        log_message "ERROR" "Failed to stop AI service."
        exit 1
    else
        echo -e "${GREEN}[SUCCESS] AI service stopped successfully.${NC}"
        log_message "SUCCESS" "AI service stopped."
    fi

}

# ----------------------------------------------------------
# MAIN PROGRAM
# ----------------------------------------------------------

main() {

    show_banner "Stop Service"

    stop_service

    verify_shutdown

}

main

