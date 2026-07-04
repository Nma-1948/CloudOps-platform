#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# LOGGING FUNCTIONS
#
# Purpose:
#   Provides reusable logging functions for all scripts.
#
# ==========================================================

LOG_FILE="$HOME/ai-devops-classifier/logs/automation.log"

mkdir -p "$(dirname "$LOG_FILE")"

# ----------------------------------------------------------
# LOG MESSAGE
# ----------------------------------------------------------

log_message() {

    local LEVEL="$1"

    local MESSAGE="$2"

    local TIMESTAMP

    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    echo "[$TIMESTAMP] [$LEVEL] $MESSAGE" >> "$LOG_FILE"

}

