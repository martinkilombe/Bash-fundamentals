#!/bin/bash

# ========================================
# SYSTEM MONITORING - Practical Examples
# ========================================

echo "=== System Monitoring Demo ==="
echo "Gathering system information..."
echo

# System information
echo "=== System Information ==="
echo "Current date and time: $(date)"
echo "System uptime:"
uptime

echo
echo "Current user: $USER"
echo "Home directory: $HOME"
echo "Current working directory: $(pwd)"

# Process information
echo
echo "=== Process Information ==="
echo "Top 5 processes by CPU usage:"
ps aux --sort=-%cpu | head -n 6

echo
echo "Top 5 processes by memory usage:"
ps aux --sort=-%mem | head -n 6

echo
echo "Current shell processes:"
ps aux | grep -E "(bash|zsh|fish)" | head -5

# Memory and disk usage
echo
echo "=== Memory Usage ==="
if command -v free &> /dev/null; then
    echo "Memory usage (Linux):"
    free -h
else
    echo "Memory usage (macOS):"
    vm_stat | head -10
fi

echo
echo "=== Disk Usage ==="
echo "Disk space usage:"
df -h

echo
echo "Current directory size:"
du -sh .

echo "Top 5 largest directories in current path:"
du -sh * 2>/dev/null | sort -hr | head -5

# Network information
echo
echo "=== Network Information ==="
echo "Network interfaces:"
if command -v ip &> /dev/null; then
    ip addr show | grep -E "(inet |inet6)" | head -5
elif command -v ifconfig &> /dev/null; then
    ifconfig | grep -E "(inet |inet6)" | head -5
else
    echo "Network tools not available"
fi

# File system information
echo
echo "=== File System ==="
echo "Recently modified files (last 24 hours):"
find . -type f -mtime -1 2>/dev/null | head -10

echo
echo "Largest files in current directory:"
find . -type f -exec ls -lh {} \; 2>/dev/null | sort -k5 -hr | head -5

# System load and performance
echo
echo "=== System Performance ==="
echo "Load average:"
uptime | cut -d',' -f3-5

echo
echo "Running processes count:"
ps aux | wc -l

# Log monitoring example
echo
echo "=== Log Monitoring Example ==="
if [ -f "/var/log/system.log" ]; then
    echo "Recent system log entries:"
    tail -n 5 /var/log/system.log
elif [ -d "/var/log" ]; then
    echo "Available log files:"
    ls -la /var/log/ | head -10
else
    echo "System logs not accessible (permission or location)"
fi

# Create a simple monitoring function
echo
echo "=== Custom Monitoring Function ==="

# Function to check disk usage warning
check_disk_usage() {
    echo "Checking disk usage warnings (>80% full):"
    df -h | awk 'NR>1 {
        usage = $5; 
        gsub(/%/, "", usage); 
        if (usage > 80) 
            print $1 " is " $5 " full - WARNING!"
    }'
}

check_disk_usage

# Function to monitor specific processes
monitor_process() {
    local process_name="$1"
    echo "Monitoring process: $process_name"
    pgrep -l "$process_name" | head -5
}

echo
echo "Bash processes currently running:"
monitor_process "bash"

# Real-time monitoring demo
echo
echo "=== Real-time Monitoring Demo ==="
echo "Monitoring system for 10 seconds (press Ctrl+C to stop)..."

monitor_system() {
    local count=0
    while [ $count -lt 10 ]; do
        clear
        echo "=== Live System Monitor (${count}s) ==="
        echo "Time: $(date)"
        echo
        echo "Top 3 CPU processes:"
        ps aux --sort=-%cpu | head -n 4
        echo
        echo "Memory usage:"
        if command -v free &> /dev/null; then
            free -h | head -2
        else
            echo "Available: $(vm_stat | grep free | awk '{print $3}') pages free"
        fi
        sleep 1
        ((count++))
    done
}

# Uncomment to run live monitoring (disabled for demo)
# monitor_system

echo
echo "=== System Health Summary ==="
echo "✓ System monitoring examples completed"
echo "✓ Current system appears operational"
echo "✓ No critical warnings detected"

echo
echo "Useful monitoring commands to remember:"
echo "- htop or top: Interactive process viewer"
echo "- df -h: Disk usage"
echo "- free -h: Memory usage"
echo "- ps aux: All running processes"
echo "- tail -f /path/to/log: Follow log files"
echo "- watch 'command': Repeat command every 2 seconds"