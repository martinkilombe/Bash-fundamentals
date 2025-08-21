#!/bin/bash

# ========================================
# BASH FUNDAMENTALS - Learning Guide
# ========================================

# Basic Command Structure:
# command [options] [arguments]

# ========================================
# 1. FILE AND DIRECTORY LISTING
# ========================================

# List files and directories
ls

# List with detailed information (long format)
ls -l

# List all files including hidden ones
ls -a

# Combine flags: long format + all files
ls -la

# List with human-readable file sizes
ls -lh

# List files by modification time (newest first)
ls -lt

# ========================================
# 2. DIRECTORY OPERATIONS
# ========================================

# Create a directory
mkdir my_directory

# Create nested directories (parent directories too)
mkdir -p path/to/nested/directory

# Remove empty directory
rmdir my_directory

# Remove directory and its contents (be careful!)
# rm -rf my_directory

# Change directory
cd my_directory
cd ..                    # Go to parent directory
cd ~                     # Go to home directory
cd -                     # Go to previous directory

# Print current working directory
pwd

# ========================================
# 3. FILE OPERATIONS
# ========================================

# Create empty file
touch filename.txt

# Copy file
cp source.txt destination.txt

# Copy directory and contents
cp -r source_dir destination_dir

# Move/rename file or directory
mv old_name.txt new_name.txt
mv file.txt /path/to/destination/

# Remove file
rm filename.txt

# Remove multiple files
rm file1.txt file2.txt

# ========================================
# 4. VIEWING FILE CONTENTS
# ========================================

# Display entire file content
cat filename.txt

# Display file content page by page
less filename.txt        # Use 'q' to quit
more filename.txt

# Display first 10 lines
head filename.txt

# Display first 5 lines
head -n 5 filename.txt

# Display last 10 lines
tail filename.txt

# Display last 5 lines
tail -n 5 filename.txt

# Follow file changes in real-time
tail -f logfile.txt

# ========================================
# 5. WILDCARDS AND PATTERN MATCHING
# ========================================

# * matches any number of characters
ls *.txt                 # All .txt files
ls file*                 # Files starting with "file"

# ? matches exactly one character
ls file?.txt             # file1.txt, fileA.txt, etc.

# [] matches any character within brackets
ls file[123].txt         # file1.txt, file2.txt, file3.txt
ls [a-z]*.txt           # Files starting with lowercase letter

# [!] matches any character NOT in brackets
ls [!0-9]*.txt          # Files NOT starting with a number

# ========================================
# 6. SEARCHING AND FINDING
# ========================================

# Find files by name
find . -name "*.txt"     # Find all .txt files in current directory
find /path -name "file*" # Find files starting with "file"

# Find files by type
find . -type f           # Find files only
find . -type d           # Find directories only

# Search for text within files
grep "search_term" filename.txt
grep -r "search_term" .  # Recursive search in all files
grep -i "search_term" file.txt  # Case-insensitive search

# ========================================
# 7. FILE PERMISSIONS
# ========================================

# Change file permissions (chmod)
chmod 755 script.sh      # rwxr-xr-x
chmod +x script.sh       # Add execute permission
chmod -w file.txt        # Remove write permission

# Change file ownership
# chown user:group filename

# View detailed permissions
ls -l filename.txt

# ========================================
# 8. TEXT PROCESSING
# ========================================

# Sort file contents
sort filename.txt

# Remove duplicate lines
uniq filename.txt
sort filename.txt | uniq  # Sort first, then remove duplicates

# Count lines, words, characters
wc filename.txt
wc -l filename.txt       # Count lines only
wc -w filename.txt       # Count words only

# ========================================
# 9. VARIABLES
# ========================================

# Create variable (no spaces around =)
name="John"
age=25

# Use variable (with $)
echo "Hello, $name"
echo "Age: ${age} years"

# Environment variables
echo $HOME               # Home directory
echo $PATH               # System PATH
echo $USER               # Current user

# ========================================
# 10. INPUT/OUTPUT REDIRECTION
# ========================================

# Redirect output to file (overwrite)
ls > file_list.txt

# Append output to file
ls >> file_list.txt

# Redirect input from file
sort < unsorted.txt

# Pipe output to another command
ls | grep ".txt"         # List files and filter for .txt
cat file.txt | wc -l     # Count lines in file

# ========================================
# 11. BASIC SCRIPTING CONSTRUCTS
# ========================================

# If statement
if [ -f "filename.txt" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi

# For loop
for file in *.txt; do
    echo "Processing $file"
done

# While loop
counter=1
while [ $counter -le 5 ]; do
    echo "Count: $counter"
    counter=$((counter + 1))
done

# ========================================
# 12. USEFUL KEYBOARD SHORTCUTS
# ========================================

# Ctrl+C     : Stop current command
# Ctrl+Z     : Suspend current command
# Ctrl+D     : End of file/logout
# Ctrl+L     : Clear screen
# Tab        : Auto-complete
# Up/Down    : Command history
# Ctrl+R     : Search command history

# ========================================
# 13. PROCESS MANAGEMENT
# ========================================

# List running processes
ps

# Show all processes for current user
ps -u

# Show all processes with detailed info
ps aux

# Show processes in tree format
ps -ef --forest

# Show processes for specific user
ps -u username

# Find specific process
ps aux | grep process_name

# Show process hierarchy
pstree

# Kill process by PID
kill 1234

# Kill process by name
killall process_name

# Force kill process
kill -9 1234

# List jobs running in current shell
jobs

# Bring job to foreground
fg %1

# Send job to background
bg %1

# Run command in background
command &

# Monitor system processes in real-time
top

# Interactive process viewer (if available)
htop

# Show memory usage
free -h

# Show disk usage
df -h

# Show directory size
du -sh /path/to/directory

# ========================================
# 14. GETTING HELP
# ========================================

# Manual pages
man ls                   # Manual for ls command
man grep                 # Manual for grep command

# Brief help
ls --help               # Quick help for ls
grep --help             # Quick help for grep

# Which command shows location
which ls                # Shows path to ls command
type ls                 # Shows what ls is (alias, function, etc.)

# ========================================
# PRACTICE EXERCISES
# ========================================

# 1. Create a directory structure: projects/bash/scripts
# mkdir -p projects/bash/scripts

# 2. Create three files: file1.txt, file2.txt, data.log
# touch file1.txt file2.txt data.log

# 3. List all .txt files
# ls *.txt

# 4. Copy all .txt files to scripts directory
# cp *.txt projects/bash/scripts/

# 5. Find all files modified in the last 7 days
# find . -type f -mtime -7

# 6. Count total lines in all .txt files
# wc -l *.txt

# 7. Find all running processes with "bash" in the name
# ps aux | grep bash

# 8. Check system memory and disk usage
# free -h && df -h

# 9. Monitor system processes for 10 seconds
# timeout 10 top
