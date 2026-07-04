#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# ENTERPRISE AUTO-HEAL SERVICE
#
# Purpose:
#   Monitor the AI service continuously and automatically
#   recover from failures while preventing restart loops.
#
# Features:
#   ✓ Continuous health monitoring
#   ✓ Automatic restart
#   ✓ Restart limit protection
#   ✓ Memory verification
#   ✓ Model verification
#   ✓ Timestamped logging
#
# ==========================================================

# ----------------------------------------------------------
# CONFIGURATION
# ----------------------------------------------------------

APP_DIR="$HOME/ai-devops-classifier"
MODEL_FILE="$APP_DIR/models/incident_classifier.joblib"

LOG_DIR="$APP_DIR/logs"
LOG_FILE="$LOG_DIR/autoheal.log"

CHECK_INTERVAL=30
MAX_RESTARTS=5

RESTART_COUNT=0

# ----------------------------------------------------------
# COLORS
# ----------------------------------------------------------

GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
NC="\033[0m"

mkdir -p "$LOG_DIR"

clear

echo -e "${CYAN}"
echo "======================================================"
echo " AI AUTO-HEAL WATCHDOG"
echo "======================================================"
echo -e "${NC}"

echo "Started: $(date)"
echo

# ----------------------------------------------------------
# MONITOR LOOP
# ----------------------------------------------------------

while true
do

    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    echo
    echo "[$TIMESTAMP] Checking AI Service..."

    # ------------------------------------------------------
    # VERIFY MODEL EXISTS
    # ------------------------------------------------------

    if [ ! -f "$MODEL_FILE" ]; then

        echo -e "${RED}[ERROR] Model file missing!${NC}"

        echo "[$TIMESTAMP] Model file missing." >> "$LOG_FILE"

        sleep "$CHECK_INTERVAL"

        continue

    fi

    # ------------------------------------------------------
    # VERIFY AVAILABLE MEMORY
    # ------------------------------------------------------

    AVAILABLE_MB=$(free -m | awk '/Mem:/ {print $7}')

    if [ "$AVAILABLE_MB" -lt 200 ]; then

        echo -e "${YELLOW}[WARNING] Low available memory (${AVAILABLE_MB} MB)${NC}"

        echo "[$TIMESTAMP] Low memory." >> "$LOG_FILE"

    fi

    # ------------------------------------------------------
    # HEALTH CHECK
    # ------------------------------------------------------

    if "$APP_DIR/scripts/health.sh" >/dev/null 2>&1
    then

        echo -e "${GREEN}[✓] AI Service Healthy${NC}"

        RESTART_COUNT=0

        echo "[$TIMESTAMP] HEALTHY" >> "$LOG_FILE"

    else

        echo -e "${RED}[✗] Health Check Failed${NC}"

        ((RESTART_COUNT++))

        echo "[$TIMESTAMP] Restart Attempt: $RESTART_COUNT" >> "$LOG_FILE"

        # --------------------------------------------------
        # RESTART LIMIT
        # --------------------------------------------------

        if [ "$RESTART_COUNT" -gt "$MAX_RESTARTS" ]; then

            echo
            echo -e "${RED}"
            echo "Maximum restart limit reached!"
            echo "Manual intervention required."
            echo -e "${NC}"

            echo "[$TIMESTAMP] Restart limit exceeded." >> "$LOG_FILE"

            exit 1

        fi

        echo -e "${YELLOW}Restarting AI Service...${NC}"

        "$APP_DIR/scripts/restart.sh"

    fi

    sleep "$CHECK_INTERVAL"

done

