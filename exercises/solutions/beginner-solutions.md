# Beginner Exercise Solutions

## Exercise 1: Basic Navigation and File Operations

### Task 1: Directory Navigation

```bash
# Find current directory
pwd

# List files and directories
ls

# Navigate to home directory
cd ~
# or
cd

# Create new directory
mkdir bash_practice

# Navigate into the directory
cd bash_practice
```

### Task 2: File Creation and Management

```bash
# Create empty files
touch hello.txt
touch world.txt

# List files to verify creation
ls

# Copy file
cp hello.txt hello_backup.txt

# Rename file
mv world.txt universe.txt

# Remove file
rm hello_backup.txt
```

### Task 3: Directory Operations

```bash
# Create directories
mkdir documents
mkdir images

# Move files to documents directory
mv hello.txt documents/
mv universe.txt documents/

# List contents of documents directory
ls documents/

# Remove empty directory
rmdir images

# Go back to parent directory
cd ..
```

### Verification
```bash
ls -la bash_practice/
ls -la bash_practice/documents/
```

---

## Exercise 2: File Content and Viewing

### Task 1: Creating Files with Content

**Method 1: Using echo**
```bash
# Create fruits.txt
echo -e "apple\nbanana\ncherry\ndate\nelderberry" > fruits.txt

# Create colors.txt
echo -e "red\nblue\ngreen\nyellow\npurple" > colors.txt

# Create numbers.txt
echo -e "1\n2\n3\n4\n5\n6\n7\n8\n9\n10" > numbers.txt
```

**Method 2: Using here documents**
```bash
# Create fruits.txt
cat > fruits.txt << 'EOF'
apple
banana
cherry
date
elderberry
EOF

# Create colors.txt
cat > colors.txt << 'EOF'
red
blue
green
yellow
purple
EOF

# Create numbers.txt using a loop
for i in {1..10}; do echo $i >> numbers.txt; done
```

### Task 2: Viewing File Content

```bash
# Display entire content
cat fruits.txt

# Display first 3 lines
head -n 3 fruits.txt

# Display last 2 lines
tail -n 2 colors.txt

# View page by page
less numbers.txt
# (press 'q' to quit)
```

### Task 3: Combining and Manipulating Content

```bash
# Combine files
cat fruits.txt colors.txt numbers.txt > combined.txt

# Count lines, words, characters
wc combined.txt
wc -l combined.txt  # lines only
wc -w combined.txt  # words only

# Display with line numbers
cat -n combined.txt
# or
nl combined.txt

# Search for "blue"
grep "blue" colors.txt
```

### Task 4: File Comparison

```bash
# Create copy
cp fruits.txt fruits_copy.txt

# Add "fig" to the copy
echo "fig" >> fruits_copy.txt

# Compare files
diff fruits.txt fruits_copy.txt
```

### Alternative Solutions

**Creating sequential numbers:**
```bash
# Using seq command
seq 1 10 > numbers.txt

# Using brace expansion
echo {1..10} | tr ' ' '\n' > numbers.txt
```

**Advanced content creation:**
```bash
# Create fruits.txt with a loop
for fruit in apple banana cherry date elderberry; do
    echo $fruit >> fruits.txt
done
```

**Viewing with context:**
```bash
# Show lines before and after a match
grep -C 2 "cherry" fruits.txt

# Show only matching filenames
grep -l "blue" *.txt
```

### Verification Commands and Expected Output

```bash
# Check file line counts
wc -l fruits.txt colors.txt numbers.txt
# Expected: 5 fruits.txt, 5 colors.txt, 10 numbers.txt

# Check combined file
wc -l combined.txt
# Expected: 20 lines

# Check for "blue"
grep -c "blue" colors.txt
# Expected: 1

# Check fruits_copy difference
diff fruits.txt fruits_copy.txt
# Expected: Shows addition of "fig" at end
```

### Challenge Extension Solutions

**Sort fruits alphabetically:**
```bash
sort fruits.txt
# or to save sorted version
sort fruits.txt > fruits_sorted.txt
```

**Count files containing "e":**
```bash
grep -l "e" *.txt | wc -l
```

**Create file with unique lines:**
```bash
sort combined.txt | uniq > unique_lines.txt
```

**Find longest line:**
```bash
wc -L combined.txt
# or to see the actual line
awk 'length > max {max=length; line=$0} END {print line}' combined.txt
```

### Common Mistakes and Solutions

**Mistake:** Using `echo` without `-e` for newlines
```bash
# Wrong
echo "apple\nbanana" > fruits.txt

# Correct
echo -e "apple\nbanana" > fruits.txt
```

**Mistake:** Forgetting to use `>>` for appending
```bash
# Wrong (overwrites file)
echo "fig" > fruits_copy.txt

# Correct (appends to file)
echo "fig" >> fruits_copy.txt
```

**Mistake:** Using `cat` with large files instead of `less`
```bash
# Not ideal for large files
cat very_large_file.txt

# Better for large files
less very_large_file.txt
```

### Pro Tips

1. **Use tab completion:** Type first few letters and press Tab
2. **Use history:** Press Up arrow to see previous commands
3. **Use wildcards:** `*.txt` to work with all text files
4. **Combine commands:** `cat fruits.txt | wc -l` for quick line count
5. **Check before removing:** `ls` before `rm` to verify files