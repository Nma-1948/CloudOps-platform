#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# VALIDATION FUNCTIONS
#
# Purpose:
#   Provides reusable validation functions used by all
#   automation scripts.
#
# ==========================================================

# ----------------------------------------------------------
# VERIFY MODEL FILE EXISTS
# ----------------------------------------------------------

validate_model() {

    if [ -f "$MODEL_FILE" ]
    then
        return 0
    else
        return 1
    fi

}

# ----------------------------------------------------------
# VERIFY AVAILABLE MEMORY
# ----------------------------------------------------------

validate_memory() {

    AVAILABLE_MB=$(free -m | awk '/Mem:/ {print $7}')

    if [ "$AVAILABLE_MB" -ge "$MIN_AVAILABLE_MEMORY_MB" ]
    then
        return 0
    else
        return 1
    fi

}

# ----------------------------------------------------------
# VERIFY DISK SPACE
# ----------------------------------------------------------

validate_disk() {

    DISK_USED=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

    if [ "$DISK_USED" -lt 90 ]
    then
        return 0
    else
        return 1
    fi

}

# ----------------------------------------------------------
# VERIFY PORT IS LISTENING
# ----------------------------------------------------------

validate_port() {

    if ss -tulpn | grep -q ":$PORT"
    then
        return 0
    else
        return 1
    fi

}

# ----------------------------------------------------------
# VERIFY UVICORN PROCESS
# ----------------------------------------------------------

validate_process() {

    if pgrep -f "uvicorn app:app" >/dev/null
    then
        return 0
    else
        return 1
    fi

}

