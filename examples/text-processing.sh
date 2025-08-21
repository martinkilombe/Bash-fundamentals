#!/bin/bash

# ========================================
# TEXT PROCESSING - Practical Examples
# ========================================

echo "=== Text Processing Demo ==="
echo

# Create sample data files
echo "Creating sample data files..."
cat > sample_data.txt << 'EOF'
John,25,Engineer,New York
Jane,30,Designer,Los Angeles
Bob,22,Developer,Chicago
Alice,28,Manager,Boston
Charlie,35,Analyst,Seattle
David,26,Engineer,New York
Eve,29,Designer,San Francisco
Frank,31,Developer,Austin
Grace,24,Analyst,Denver
Henry,33,Manager,Phoenix
EOF

cat > log_data.txt << 'EOF'
2024-01-15 10:30:12 INFO: Application started
2024-01-15 10:30:15 DEBUG: Loading configuration
2024-01-15 10:30:20 INFO: Database connected
2024-01-15 10:35:45 ERROR: Failed to process request
2024-01-15 10:40:10 WARN: High memory usage detected
2024-01-15 10:45:30 INFO: Backup completed
2024-01-15 11:00:00 ERROR: Network timeout
2024-01-15 11:15:22 INFO: System maintenance started
EOF

echo "Sample files created!"
echo

# Basic text viewing
echo "=== Viewing Text Files ==="
echo "First 3 lines of data:"
head -n 3 sample_data.txt

echo
echo "Last 2 lines of data:"
tail -n 2 sample_data.txt

echo
echo "Total lines, words, and characters:"
wc sample_data.txt

# Searching with grep
echo
echo "=== Searching with grep ==="
echo "Engineers in the data:"
grep "Engineer" sample_data.txt

echo
echo "People in New York:"
grep "New York" sample_data.txt

echo
echo "Error messages in logs:"
grep "ERROR" log_data.txt

echo
echo "Case-insensitive search for 'info':"
grep -i "info" log_data.txt

# Sorting and unique operations
echo
echo "=== Sorting Operations ==="
echo "Sorted by name (first column):"
sort sample_data.txt

echo
echo "Sorted by age (second column, numeric):"
sort -t',' -k2 -n sample_data.txt

echo
echo "Unique cities:"
cut -d',' -f4 sample_data.txt | sort | uniq

echo
echo "Count of people per city:"
cut -d',' -f4 sample_data.txt | sort | uniq -c

# Advanced text processing
echo
echo "=== Advanced Processing ==="
echo "People older than 27:"
awk -F',' '$2 > 27 {print $1 " (" $2 " years old)"}' sample_data.txt

echo
echo "Average age:"
awk -F',' '{sum += $2; count++} END {print "Average age: " sum/count}' sample_data.txt

echo
echo "Log summary by level:"
awk '{print $3}' log_data.txt | sort | uniq -c

# Text manipulation
echo
echo "=== Text Manipulation ==="
echo "Converting names to uppercase:"
awk -F',' '{print toupper($1) "," $2 "," $3 "," $4}' sample_data.txt | head -3

echo
echo "Extracting just names and ages:"
cut -d',' -f1,2 sample_data.txt

echo
echo "Replacing 'Engineer' with 'Software Engineer':"
sed 's/Engineer/Software Engineer/g' sample_data.txt | grep "Software"

# Combining operations with pipes
echo
echo "=== Pipe Combinations ==="
echo "Engineers in New York, sorted by age:"
grep "Engineer" sample_data.txt | grep "New York" | sort -t',' -k2 -n

echo
echo "Most recent error in logs:"
grep "ERROR" log_data.txt | tail -n 1

echo
echo "Unique job titles:"
cut -d',' -f3 sample_data.txt | sort | uniq | tr '\n' ', ' | sed 's/,$/\n/'

# File comparison
echo
echo "=== File Operations ==="
echo "Creating backup of sample data..."
cp sample_data.txt sample_data_backup.txt

echo "Adding a new record..."
echo "Lisa,27,Tester,Miami" >> sample_data.txt

echo "Differences between original and modified:"
diff sample_data_backup.txt sample_data.txt

# Cleanup
echo
echo "=== Cleanup ==="
read -p "Remove sample files? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -f sample_data.txt sample_data_backup.txt log_data.txt
    echo "Sample files removed."
else
    echo "Sample files kept for your exploration."
fi