#!/bin/bash

# ========================================
# FILE OPERATIONS - Practical Examples
# ========================================

echo "=== File Operations Demo ==="
echo

# Create a test directory structure
echo "Creating test directory structure..."
mkdir -p demo/{docs,images,scripts}
mkdir -p demo/backup

# Create sample files
echo "Creating sample files..."
echo "This is a text document" > demo/docs/readme.txt
echo "Another document" > demo/docs/notes.txt
echo "#!/bin/bash" > demo/scripts/script.sh
echo "echo 'Hello World'" >> demo/scripts/script.sh
echo "Binary data placeholder" > demo/images/photo.jpg

echo "Directory structure created!"
echo

# Demonstrate ls variations
echo "=== Listing Files ==="
echo "Basic listing:"
ls demo/

echo
echo "Detailed listing with permissions:"
ls -la demo/docs/

echo
echo "Files sorted by modification time:"
ls -lt demo/

# Demonstrate copying operations
echo
echo "=== Copying Operations ==="
echo "Copying single file:"
cp demo/docs/readme.txt demo/backup/
echo "Copied readme.txt to backup/"

echo "Copying multiple files:"
cp demo/docs/*.txt demo/backup/
echo "Copied all .txt files to backup/"

echo "Copying directory recursively:"
cp -r demo/scripts demo/backup/
echo "Copied scripts directory to backup/"

# Demonstrate finding files
echo
echo "=== Finding Files ==="
echo "All .txt files:"
find demo -name "*.txt"

echo
echo "All files in docs directory:"
find demo/docs -type f

echo
echo "Files larger than 10 bytes:"
find demo -type f -size +10c

# Demonstrate file permissions
echo
echo "=== File Permissions ==="
echo "Making script executable:"
chmod +x demo/scripts/script.sh
ls -l demo/scripts/script.sh

# Demonstrate file information
echo
echo "=== File Information ==="
echo "File count by type:"
echo "Text files: $(find demo -name "*.txt" | wc -l)"
echo "Script files: $(find demo -name "*.sh" | wc -l)"
echo "Total files: $(find demo -type f | wc -l)"

echo
echo "Directory sizes:"
du -sh demo/*

# Cleanup option
echo
echo "=== Cleanup ==="
read -p "Remove demo directory? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf demo
    echo "Demo directory removed."
else
    echo "Demo directory kept for your exploration."
fi