#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# NETWORK FUNCTIONS
#
# Purpose:
#   Provides reusable API and network validation functions.
#
# ==========================================================

# ----------------------------------------------------------
# CHECK API ROOT ENDPOINT
# ----------------------------------------------------------

check_api() {

    curl -s "$API_URL/" > /dev/null

}

# ----------------------------------------------------------
# CHECK AI PREDICTION ENDPOINT
# ----------------------------------------------------------

check_prediction() {

    curl -s \
    -X POST "$API_URL/predict" \
    -H "Content-Type: application/json" \
    -d '{"text":"Pod crash loop detected"}'

}

# ----------------------------------------------------------
# MEASURE API RESPONSE TIME
# ----------------------------------------------------------

measure_latency() {

    curl -o /dev/null \
         -s \
         -w "%{time_total}" \
         "$API_URL/"

}

