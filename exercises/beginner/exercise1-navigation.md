# Exercise 1: Basic Navigation and File Operations

## Objective
Learn basic navigation commands and file operations in bash.

## Prerequisites
- Access to a terminal
- Basic understanding of directory structure

## Tasks

### Task 1: Directory Navigation
1. Open your terminal
2. Find out what directory you're currently in
3. List all files and directories in your current location
4. Navigate to your home directory
5. Create a new directory called `bash_practice`
6. Navigate into the `bash_practice` directory

**Commands you'll need:** `pwd`, `ls`, `cd`, `mkdir`

### Task 2: File Creation and Management
1. Create an empty file called `hello.txt`
2. Create another file called `world.txt`
3. List all files to verify they were created
4. Copy `hello.txt` to `hello_backup.txt`
5. Rename `world.txt` to `universe.txt`
6. Remove the `hello_backup.txt` file

**Commands you'll need:** `touch`, `cp`, `mv`, `rm`

### Task 3: Directory Operations
1. Create a directory called `documents`
2. Create a directory called `images`
3. Move both `.txt` files into the `documents` directory
4. List the contents of the `documents` directory
5. Remove the empty `images` directory
6. Go back to the parent directory

**Commands you'll need:** `mkdir`, `mv`, `ls`, `rmdir`, `cd ..`

## Expected Results

After completing all tasks, you should have:
- A `bash_practice` directory in your home folder
- A `documents` subdirectory containing `hello.txt` and `universe.txt`
- No `images` directory (it was removed)
- Be in the parent directory of `bash_practice`

## Verification Commands

Run these commands to check your work:
```bash
ls -la bash_practice/
ls -la bash_practice/documents/
```

You should see:
- The `bash_practice` directory exists
- The `documents` directory exists inside `bash_practice`
- Two files (`hello.txt` and `universe.txt`) exist in the `documents` directory

## Hints

- If you get lost, use `pwd` to see where you are
- Use `ls` frequently to see what's in your current directory
- Remember that `cd ..` goes up one directory level
- Use `cd ~` to quickly return to your home directory

## Next Steps

Once you complete this exercise, proceed to Exercise 2: File Content and Viewing.