#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# RESTART SERVICE
#
# Purpose:
#   Restarts the AI API service.
#
# Workflow:
#   1. Display banner
#   2. Stop service (if running)
#   3. Start service
#   4. Verify startup
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
# RESTART SERVICE
# ----------------------------------------------------------

restart_service() {

    if is_running
    then
        echo -e "${BLUE}[INFO] Stopping AI service...${NC}"
        stop_process
        sleep 2
    fi

    echo -e "${BLUE}[INFO] Starting AI service...${NC}"

    log_message "INFO" "Restarting AI service."

    start_process

}

# ----------------------------------------------------------
# VERIFY STARTUP
# ----------------------------------------------------------

verify_restart() {

    sleep 3

    if is_running
    then
        echo -e "${GREEN}[SUCCESS] AI service restarted successfully.${NC}"
        log_message "SUCCESS" "AI service restarted."
    else
        echo -e "${RED}[ERROR] Failed to restart AI service.${NC}"
        log_message "ERROR" "AI service failed to restart."
        exit 1
    fi

}

# ----------------------------------------------------------
# MAIN PROGRAM
# ----------------------------------------------------------

main() {

    show_banner "Restart Service"

    if ! validate_model
    then
        echo -e "${RED}[ERROR] Model file not found.${NC}"
        exit 1
    fi

    restart_service

    verify_restart

}

main

