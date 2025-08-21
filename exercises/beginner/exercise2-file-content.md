# Exercise 2: File Content and Viewing

## Objective
Learn to create, view, and manipulate file content using bash commands.

## Prerequisites
- Completed Exercise 1
- Basic understanding of file operations

## Setup
Navigate to your `bash_practice` directory from Exercise 1, or create it if needed:
```bash
cd ~/bash_practice
mkdir -p documents
```

## Tasks

### Task 1: Creating Files with Content
1. Create a file called `fruits.txt` with the following content:
   ```
   apple
   banana
   cherry
   date
   elderberry
   ```
2. Create a file called `colors.txt` with these colors:
   ```
   red
   blue
   green
   yellow
   purple
   ```
3. Create a file called `numbers.txt` with numbers 1-10, one per line

**Hint:** Use `echo` with `>` to create files, or use a text editor like `nano`

### Task 2: Viewing File Content
1. Display the entire content of `fruits.txt`
2. Display only the first 3 lines of `fruits.txt`
3. Display only the last 2 lines of `colors.txt`
4. View `numbers.txt` page by page (useful for large files)

**Commands you'll need:** `cat`, `head`, `tail`, `less` or `more`

### Task 3: Combining and Manipulating Content
1. Combine all three files into a new file called `combined.txt`
2. Count the total number of lines in `combined.txt`
3. Count the total number of words in `combined.txt`
4. Display the content of `combined.txt` with line numbers
5. Search for the word "blue" in `colors.txt`

**Commands you'll need:** `cat`, `wc`, `grep`

### Task 4: File Comparison
1. Create a copy of `fruits.txt` called `fruits_copy.txt`
2. Add "fig" to the end of `fruits_copy.txt`
3. Compare the original `fruits.txt` with `fruits_copy.txt` to see the differences

**Commands you'll need:** `cp`, `echo >>`, `diff`

## Expected Results

After completing all tasks, you should have:
- `fruits.txt` with 5 fruit names
- `colors.txt` with 5 color names  
- `numbers.txt` with numbers 1-10
- `combined.txt` containing all the above content
- `fruits_copy.txt` with 6 fruit names (including "fig")

## Verification Commands

Check your work with these commands:
```bash
wc -l fruits.txt colors.txt numbers.txt
cat combined.txt | wc -l
grep -c "blue" colors.txt
```

Expected output:
- Each individual file should have the correct number of lines
- `combined.txt` should have 20 lines total (5+5+10)
- The grep command should find 1 occurrence of "blue"

## Sample Solutions

**Creating fruits.txt:**
```bash
echo -e "apple\nbanana\ncherry\ndate\nelderberry" > fruits.txt
```

**Viewing first 3 lines:**
```bash
head -n 3 fruits.txt
```

**Combining files:**
```bash
cat fruits.txt colors.txt numbers.txt > combined.txt
```

## Challenge Extensions

If you finish early, try these additional challenges:
1. Sort the contents of `fruits.txt` alphabetically
2. Count how many files contain the letter "e"
3. Create a file with only the unique lines from `combined.txt`
4. Find the longest line in `combined.txt`

## Troubleshooting

- **File not found:** Make sure you're in the right directory (`pwd`)
- **Permission denied:** Check file permissions with `ls -l`
- **Command not working:** Verify the command syntax with `man command_name`

## Next Steps

Once you complete this exercise, proceed to Exercise 3: Wildcards and Pattern Matching.