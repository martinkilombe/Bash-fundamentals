# Intermediate Exercise 1: Advanced Text Processing

## Objective
Master text processing commands including grep, sort, awk, and pipes for real-world data manipulation.

## Prerequisites
- Completed beginner exercises
- Understanding of basic file operations
- Familiarity with pipes and redirection

## Setup
Create a working directory and sample data:
```bash
mkdir ~/bash_intermediate
cd ~/bash_intermediate
```

## Tasks

### Task 1: Working with CSV Data
Create a file called `employees.csv` with this content:
```
Name,Department,Salary,Years
John Smith,Engineering,75000,5
Jane Doe,Marketing,65000,3
Bob Johnson,Engineering,82000,7
Alice Brown,Sales,58000,2
Charlie Wilson,Marketing,70000,4
David Lee,Engineering,90000,8
Eve Taylor,Sales,62000,6
Frank Miller,HR,55000,1
```

**Your Tasks:**
1. Display only the names and salaries (columns 1 and 3)
2. Find all employees in the Engineering department
3. Show employees sorted by salary (highest to lowest)
4. Count how many employees are in each department
5. Calculate the average salary of all employees

**Commands to use:** `cut`, `grep`, `sort`, `uniq`, `awk`

### Task 2: Log File Analysis
Create a log file called `server.log`:
```
2024-01-15 08:30:15 INFO User login successful: john@example.com
2024-01-15 08:35:22 ERROR Database connection failed
2024-01-15 08:40:10 INFO User login successful: jane@example.com
2024-01-15 08:45:33 WARN High memory usage: 85%
2024-01-15 09:15:45 ERROR File not found: /var/log/app.log
2024-01-15 09:30:12 INFO User logout: john@example.com
2024-01-15 10:15:28 INFO User login successful: bob@example.com
2024-01-15 10:45:16 ERROR Network timeout
2024-01-15 11:20:33 WARN Disk space low: 90%
2024-01-15 11:35:47 INFO User logout: jane@example.com
```

**Your Tasks:**
1. Extract all ERROR messages
2. Count the number of each log level (INFO, ERROR, WARN)
3. Find all login events
4. Show unique email addresses that appear in the logs
5. Display logs between 09:00 and 11:00

### Task 3: Data Transformation
Create a file called `sales_data.txt`:
```
Product:Laptop,Price:999,Quantity:5,Date:2024-01-15
Product:Mouse,Price:25,Quantity:50,Date:2024-01-15
Product:Keyboard,Price:75,Quantity:20,Date:2024-01-15
Product:Monitor,Price:299,Quantity:8,Date:2024-01-16
Product:Laptop,Price:999,Quantity:3,Date:2024-01-16
```

**Your Tasks:**
1. Convert this to proper CSV format (Product,Price,Quantity,Date)
2. Calculate total revenue for each product (Price × Quantity)
3. Find the product with highest single-day sales
4. Group sales by date and show daily totals

### Task 4: Advanced Pattern Matching
**Your Tasks:**
1. Create a script that finds all email addresses in any text file
2. Extract all IP addresses from log files (format: xxx.xxx.xxx.xxx)
3. Find all phone numbers in format (xxx) xxx-xxxx
4. Count occurrences of specific patterns

## Sample Solutions

### Task 1 Solutions

**Display names and salaries:**
```bash
cut -d',' -f1,3 employees.csv
```

**Find Engineering employees:**
```bash
grep "Engineering" employees.csv
```

**Sort by salary (descending):**
```bash
tail -n +2 employees.csv | sort -t',' -k3 -nr
```

**Count employees by department:**
```bash
tail -n +2 employees.csv | cut -d',' -f2 | sort | uniq -c
```

**Calculate average salary:**
```bash
tail -n +2 employees.csv | cut -d',' -f3 | awk '{sum+=$1} END {print "Average:", sum/NR}'
```

### Task 2 Solutions

**Extract ERROR messages:**
```bash
grep "ERROR" server.log
```

**Count log levels:**
```bash
awk '{print $3}' server.log | sort | uniq -c
```

**Find login events:**
```bash
grep "login successful" server.log
```

**Extract unique emails:**
```bash
grep -o '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' server.log | sort | uniq
```

## Verification

Check your solutions with these commands:

**For Task 1:**
- Employee count should be 8
- Engineering department should have 3 employees
- Highest salary should be $90,000

**For Task 2:**
- Should find 3 ERROR messages
- Should find 3 login events
- Should extract 3 unique email addresses

## Challenge Extensions

1. **Data Pipeline:** Create a pipeline that processes multiple CSV files and generates a summary report
2. **Real-time Monitoring:** Use `tail -f` to monitor a log file and alert on ERROR messages
3. **Data Validation:** Write a script that validates CSV data integrity
4. **Performance Analysis:** Analyze server logs to identify peak usage times

## Advanced Techniques

### Using awk for Complex Processing
```bash
# Calculate running totals
awk -F',' 'NR>1 {sum+=$3; print $1, $3, sum}' employees.csv

# Conditional processing
awk -F',' 'NR>1 && $3>70000 {print $1 " earns " $3}' employees.csv
```

### Complex grep Patterns
```bash
# Multiple patterns
grep -E "(ERROR|WARN)" server.log

# Case-insensitive with line numbers
grep -in "login" server.log
```

## Next Steps

Once you complete this exercise, proceed to:
- Exercise 2: Process Management and System Monitoring
- Advanced scripting with functions and error handling

## Troubleshooting

- **awk errors:** Check field separators with -F option
- **grep not finding patterns:** Try -E for extended regex
- **sort not working:** Verify delimiter with -t option
- **Permission issues:** Check file permissions with `ls -l`