#!/bin/bash

# ==========================================================
# AI DEVOPS INCIDENT CLASSIFIER
# PROCESS MANAGEMENT FUNCTIONS
#
# Purpose:
#   Provides reusable process management functions.
#
# ==========================================================

# ----------------------------------------------------------
# CHECK IF AI SERVICE IS RUNNING
# ----------------------------------------------------------

is_running() {

    pgrep -f "uvicorn app:app" >/dev/null

}

# ----------------------------------------------------------
# GET AI SERVICE PID
# ----------------------------------------------------------

get_pid() {

    pgrep -f "uvicorn app:app"

}

# ----------------------------------------------------------
# STOP AI SERVICE
# ----------------------------------------------------------

stop_process() {

    pkill -f "uvicorn app:app"

}

# ----------------------------------------------------------
# START AI SERVICE
# ----------------------------------------------------------

start_process() {

    mkdir -p "$LOG_DIR"

    cd "$APP_DIR" || exit 1

    nohup ./venv/bin/python3 -m uvicorn app:app \
        --host "$HOST" \
        --port "$PORT" \
        > "$LOG_DIR/uvicorn.log" 2>&1 &

}

