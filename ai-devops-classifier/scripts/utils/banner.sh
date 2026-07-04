#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# BANNER FUNCTIONS
#
# Purpose:
#   Display standardized banners across all automation
#   scripts.
#
# ==========================================================

# ----------------------------------------------------------
# DISPLAY STANDARD BANNER
# ----------------------------------------------------------

show_banner() {

    local TITLE="$1"

    clear

    echo -e "${CYAN}"
    echo "=========================================================="
    echo "           AI DEVOPS INCIDENT CLASSIFIER"
    echo "=========================================================="
    echo -e "${WHITE}${TITLE}${NC}"
    echo "----------------------------------------------------------"
    echo "Time : $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Host : $(hostname)"
    echo "User : $(whoami)"
    echo "=========================================================="
    echo

}

