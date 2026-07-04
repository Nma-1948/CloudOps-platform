#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# GLOBAL CONFIGURATION
#
# Purpose:
#   Stores shared configuration values used throughout
#   the automation toolkit.
#
# ==========================================================

# ----------------------------------------------------------
# PROJECT DIRECTORIES
# ----------------------------------------------------------

APP_DIR="$HOME/ai-devops-classifier"

SCRIPT_DIR="$APP_DIR/scripts"

LOG_DIR="$APP_DIR/logs"

MODEL_DIR="$APP_DIR/models"

DATA_DIR="$APP_DIR/data"

# ----------------------------------------------------------
# MODEL
# ----------------------------------------------------------

MODEL_FILE="$MODEL_DIR/incident_classifier.joblib"

# ----------------------------------------------------------
# API CONFIGURATION
# ----------------------------------------------------------

HOST="0.0.0.0"

PORT=8000

API_URL="http://localhost:$PORT"

# ----------------------------------------------------------
# MONITORING
# ----------------------------------------------------------

CHECK_INTERVAL=30

MAX_RESTARTS=5

MIN_AVAILABLE_MEMORY_MB=200

