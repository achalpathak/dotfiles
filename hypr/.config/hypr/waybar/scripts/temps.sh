#!/bin/bash

# Get CPU temperature
cpu_temp=$(sensors | grep 'Tctl:' | awk '{print $2}' | sed 's/+//;s/°C//')

# Get GPU temperature
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)

# Output the temperatures
echo "🌡️ CPU: ${cpu_temp}°C  GPU: ${gpu_temp}°C"

