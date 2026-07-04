#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# HEALTH CHECK SCRIPT
#
# Purpose:
#   Verifies that the AI API is operational and capable of
#   processing predictions.
#
# Checks Performed:
#   1. API Availability
#   2. HTTP Status
#   3. AI Model Prediction
#
# Author: Ikenna
# ==========================================================

# -----------------------------
# CONFIGURATION
# -----------------------------

API_URL="http://localhost:8000/predict"

# ANSI color codes
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
NC="\033[0m"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

clear

echo -e "${CYAN}"
echo "========================================================="
echo " AI MODEL HEALTH CHECK"
echo "========================================================="
echo -e "${NC}"

echo "Time: $TIMESTAMP"
echo

# -----------------------------
# SEND TEST PREDICTION
# -----------------------------

RESPONSE=$(curl -s \
-X POST "$API_URL" \
-H "Content-Type: application/json" \
-d '{"text":"Pod crash loop detected"}')

# -----------------------------
# VERIFY RESPONSE
# -----------------------------

if echo "$RESPONSE" | grep -q "incident_type"; then

    echo -e "${GREEN}[✓] AI Model is HEALTHY${NC}"
    echo
    echo "Prediction:"
    echo "$RESPONSE"

    exit 0

else

    echo -e "${RED}[✗] AI Model FAILED Health Check${NC}"
    echo
    echo "Response:"
    echo "$RESPONSE"

    exit 1

fi
