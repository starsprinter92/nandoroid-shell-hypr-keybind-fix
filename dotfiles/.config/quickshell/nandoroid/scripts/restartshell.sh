#!/bin/bash

# Nandoroid Restart Script
# Restarts the quickshell instance safely

# 1. Kill existing instances
killall quickshell 2>/dev/null

# 2. Wait a moment
sleep 0.5

# 3. Start new instance
nohup quickshell -c nandoroid > /dev/null 2>&1 &

exit 0
