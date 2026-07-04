#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# START SERVICE
#
# Purpose:
#   Starts the AI API service.
#
# Workflow:
#   1. Display banner
#   2. Check if service is already running
#   3. Validate model
#   4. Validate memory
#   5. Start service
#   6. Verify startup
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
# CHECK SERVICE STATUS
# ----------------------------------------------------------

check_service() {

    if is_running
    then

        echo -e "${YELLOW}[INFO] AI service is already running.${NC}"

        log_message "INFO" "Start request ignored. Service already running."

        exit 0

    fi

}

# ----------------------------------------------------------
# VALIDATE SYSTEM
# ----------------------------------------------------------

validate_system() {

    if ! validate_model
    then

        echo -e "${RED}[ERROR] Model file not found.${NC}"

        log_message "ERROR" "Model file missing."

        exit 1

    fi

    if ! validate_memory
    then

        echo -e "${RED}[ERROR] Insufficient available memory.${NC}"

        log_message "ERROR" "Low available memory."

        exit 1

    fi

}

# ----------------------------------------------------------
# START SERVICE
# ----------------------------------------------------------

run_service() {

    echo -e "${BLUE}[INFO] Starting AI service...${NC}"

    log_message "INFO" "Starting AI service."

    start_process

}

# ----------------------------------------------------------
# VERIFY STARTUP
# ----------------------------------------------------------

verify_service() {

    sleep 3

    if is_running
    then

        echo -e "${GREEN}[SUCCESS] AI service started successfully.${NC}"

        log_message "SUCCESS" "AI service started."

    else

        echo -e "${RED}[ERROR] AI service failed to start.${NC}"

        log_message "ERROR" "Startup failed."

        exit 1

    fi

}

# ----------------------------------------------------------
# MAIN PROGRAM
# ----------------------------------------------------------

main() {

    show_banner "Start Service"

    check_service

    validate_system

    run_service

    verify_service

}

main

