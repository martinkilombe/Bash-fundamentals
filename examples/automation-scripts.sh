#!/bin/bash

# ========================================
# AUTOMATION SCRIPTS - Practical Examples
# ========================================

echo "=== Automation Scripts Demo ==="
echo

# Function definitions
backup_files() {
    local source_dir="$1"
    local backup_dir="$2"
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_name="backup_${timestamp}"
    
    echo "Creating backup of $source_dir..."
    mkdir -p "$backup_dir/$backup_name"
    cp -r "$source_dir"/* "$backup_dir/$backup_name/" 2>/dev/null
    echo "Backup created: $backup_dir/$backup_name"
}

clean_temp_files() {
    local target_dir="${1:-.}"
    echo "Cleaning temporary files in $target_dir..."
    
    local count=0
    for pattern in "*.tmp" "*.log" "*~" ".DS_Store"; do
        while IFS= read -r -d '' file; do
            echo "Removing: $file"
            rm "$file"
            ((count++))
        done < <(find "$target_dir" -name "$pattern" -type f -print0 2>/dev/null)
    done
    
    echo "Cleaned $count temporary files"
}

organize_downloads() {
    local downloads_dir="${1:-$HOME/Downloads}"
    echo "Organizing files in $downloads_dir..."
    
    if [ ! -d "$downloads_dir" ]; then
        echo "Directory $downloads_dir does not exist"
        return 1
    fi
    
    # Create organization directories
    mkdir -p "$downloads_dir"/{Images,Documents,Videos,Archives,Others}
    
    # Move files based on extension
    cd "$downloads_dir" || return
    
    # Images
    for ext in jpg jpeg png gif bmp svg; do
        find . -maxdepth 1 -name "*.$ext" -exec mv {} Images/ \; 2>/dev/null
    done
    
    # Documents
    for ext in pdf doc docx txt rtf; do
        find . -maxdepth 1 -name "*.$ext" -exec mv {} Documents/ \; 2>/dev/null
    done
    
    # Videos
    for ext in mp4 avi mkv mov wmv; do
        find . -maxdepth 1 -name "*.$ext" -exec mv {} Videos/ \; 2>/dev/null
    done
    
    # Archives
    for ext in zip rar tar gz 7z; do
        find . -maxdepth 1 -name "*.$ext" -exec mv {} Archives/ \; 2>/dev/null
    done
    
    echo "Downloads organized successfully!"
}

generate_report() {
    local report_file="system_report_$(date +%Y%m%d).txt"
    echo "Generating system report: $report_file"
    
    {
        echo "=== SYSTEM REPORT ==="
        echo "Generated on: $(date)"
        echo "User: $USER"
        echo "Hostname: $(hostname)"
        echo
        
        echo "=== DISK USAGE ==="
        df -h
        echo
        
        echo "=== MEMORY USAGE ==="
        if command -v free &> /dev/null; then
            free -h
        else
            vm_stat | head -5
        fi
        echo
        
        echo "=== TOP PROCESSES ==="
        ps aux --sort=-%cpu | head -10
        echo
        
        echo "=== NETWORK CONNECTIONS ==="
        if command -v netstat &> /dev/null; then
            netstat -an | head -10
        else
            echo "netstat not available"
        fi
        
    } > "$report_file"
    
    echo "Report saved to: $report_file"
}

batch_rename() {
    local directory="${1:-.}"
    local old_pattern="$2"
    local new_pattern="$3"
    
    if [ -z "$old_pattern" ] || [ -z "$new_pattern" ]; then
        echo "Usage: batch_rename <directory> <old_pattern> <new_pattern>"
        return 1
    fi
    
    echo "Batch renaming files in $directory..."
    echo "Pattern: $old_pattern -> $new_pattern"
    
    local count=0
    for file in "$directory"/*"$old_pattern"*; do
        if [ -f "$file" ]; then
            local basename=$(basename "$file")
            local new_name="${basename/$old_pattern/$new_pattern}"
            local new_path="$directory/$new_name"
            
            echo "Renaming: $basename -> $new_name"
            mv "$file" "$new_path"
            ((count++))
        fi
    done
    
    echo "Renamed $count files"
}

# Demo setup
echo "=== Setting up demo environment ==="
mkdir -p automation_demo/{source,backup,downloads_demo}

# Create sample files
echo "Creating sample files..."
echo "Document content" > automation_demo/source/document.txt
echo "Config data" > automation_demo/source/config.conf
echo "Temporary data" > automation_demo/source/temp.tmp
echo "Log entry" > automation_demo/source/app.log

# Create sample downloads
touch automation_demo/downloads_demo/photo.jpg
touch automation_demo/downloads_demo/video.mp4
touch automation_demo/downloads_demo/document.pdf
touch automation_demo/downloads_demo/archive.zip
touch automation_demo/downloads_demo/random_file

echo "Demo environment ready!"
echo

# Demonstrate automation functions
echo "=== Automation Examples ==="

echo "1. File Backup:"
backup_files "automation_demo/source" "automation_demo/backup"

echo
echo "2. Cleaning Temporary Files:"
clean_temp_files "automation_demo/source"

echo
echo "3. Organizing Downloads:"
organize_downloads "automation_demo/downloads_demo"

echo
echo "4. Batch Renaming (adding prefix):"
batch_rename "automation_demo/source" "document" "old_document"

echo
echo "5. System Report Generation:"
generate_report

# Advanced automation example
echo
echo "=== Advanced Automation: File Monitor ==="

file_monitor() {
    local watch_dir="${1:-.}"
    local duration="${2:-30}"
    
    echo "Monitoring $watch_dir for file changes for $duration seconds..."
    
    local initial_count=$(find "$watch_dir" -type f | wc -l)
    local start_time=$(date +%s)
    
    while [ $(($(date +%s) - start_time)) -lt $duration ]; do
        local current_count=$(find "$watch_dir" -type f | wc -l)
        
        if [ $current_count -ne $initial_count ]; then
            echo "File change detected! Files: $initial_count -> $current_count"
            initial_count=$current_count
        fi
        
        sleep 2
    done
    
    echo "Monitoring completed"
}

# Uncomment to run file monitor
# file_monitor "automation_demo" 10

# Cron job examples
echo
echo "=== Cron Job Examples ==="
echo "Here are some useful cron job examples:"
echo
echo "# Run backup daily at 2 AM"
echo "0 2 * * * /path/to/backup_script.sh"
echo
echo "# Clean temp files every hour"
echo "0 * * * * find /tmp -name '*.tmp' -mtime +1 -delete"
echo
echo "# Generate weekly report every Sunday at midnight"
echo "0 0 * * 0 /path/to/generate_report.sh"
echo
echo "# Monitor disk space every 15 minutes"
echo "*/15 * * * * df -h | awk 'NR>1 && \$5 > 80 {print \$1\" is \"\$5\" full\"}'"

# Cleanup demonstration
echo
echo "=== Automation Summary ==="
echo "✓ File backup completed"
echo "✓ Temporary files cleaned"
echo "✓ Downloads organized"
echo "✓ Files renamed"
echo "✓ System report generated"

echo
read -p "Remove demo directory? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf automation_demo system_report_*.txt
    echo "Demo cleanup completed."
else
    echo "Demo files kept for exploration."
fi

echo
echo "=== Automation Best Practices ==="
echo "1. Always test scripts in safe environments first"
echo "2. Use meaningful variable names and comments"
echo "3. Add error handling and logging"
echo "4. Make scripts idempotent (safe to run multiple times)"
echo "5. Use functions for reusable code"
echo "6. Validate inputs and handle edge cases"
echo "7. Set proper file permissions (chmod +x)"
echo "8. Consider using configuration files for settings"