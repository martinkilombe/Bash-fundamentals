# Bash Fundamentals - Complete Learning Guide

A comprehensive resource for learning Bash scripting and command-line operations. Perfect for beginners and intermediate users looking to master the Linux/Unix command line.

## What You'll Learn

- **File and Directory Operations** - Navigate, create, modify, and organize your filesystem
- **Text Processing** - Search, sort, filter, and manipulate text files
- **Process Management** - Monitor, control, and manage running processes
- **Scripting Fundamentals** - Variables, loops, conditionals, and functions
- **I/O Redirection** - Pipes, redirects, and command chaining
- **System Administration** - Permissions, users, and system monitoring

## 📚 Repository Structure

```
bash-fundamentals/
├── README.md                    # This file
├── bash-fundamentals.sh         # Complete reference guide
├── examples/                    # Practical example scripts
│   ├── file-operations.sh
│   ├── text-processing.sh
│   ├── system-monitoring.sh
│   └── automation-scripts.sh
├── exercises/                   # Interactive practice exercises
│   ├── beginner/
│   ├── intermediate/
│   └── solutions/
└── cheatsheets/                # Quick reference materials
    ├── commands-cheatsheet.md
    └── shortcuts-cheatsheet.md
```

## 🚀 Getting Started

### Prerequisites
- Linux, macOS, or Windows with WSL/Git Bash
- Terminal access
- Text editor (nano, vim, VS Code, etc.)

### Quick Start
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/bash-fundamentals.git
   cd bash-fundamentals
   ```

2. Make the main script executable:
   ```bash
   chmod +x bash-fundamentals.sh
   ```

3. Start learning by opening `bash-fundamentals.sh` in your favorite editor

4. Practice with the examples:
   ```bash
   cd examples
   chmod +x *.sh
   ./file-operations.sh
   ```

## 📖 Learning Path

### Beginner (Start Here)
1. **Basic Commands** - ls, cd, pwd, mkdir, rmdir
2. **File Operations** - cp, mv, rm, touch, chmod
3. **Viewing Files** - cat, less, head, tail
4. **Getting Help** - man, --help, which

### Intermediate
1. **Wildcards & Patterns** - *, ?, [], {}
2. **Pipes & Redirection** - |, >, >>, <
3. **Text Processing** - grep, sort, uniq, wc
4. **Variables** - Creating, using, environment variables

### Advanced
1. **Scripting** - if/else, loops, functions
2. **Process Management** - ps, kill, jobs, bg/fg
3. **System Monitoring** - top, htop, df, du, free
4. **Advanced Text** - awk, sed, cut

## 🛠 Practice Exercises

Each exercise includes:
- **Problem description**
- **Expected output**
- **Hints** for guidance
- **Complete solution** with explanation

Navigate to the `exercises/` directory and start with the beginner folder.

## 📋 Command Quick Reference

| Category | Essential Commands |
|----------|-------------------|
| **Navigation** | `cd`, `pwd`, `ls` |
| **Files** | `cp`, `mv`, `rm`, `touch` |
| **Viewing** | `cat`, `less`, `head`, `tail` |
| **Search** | `find`, `grep`, `locate` |
| **Process** | `ps`, `top`, `kill`, `jobs` |
| **Help** | `man`, `--help`, `which` |

## 🎯 Real-World Examples

Learn through practical scenarios:
- **Log Analysis** - Parse server logs and extract insights
- **File Management** - Organize and backup files efficiently
- **System Monitoring** - Check disk space, memory, and processes
- **Automation** - Create scripts for repetitive tasks

## 🔧 Best Practices

- Always use `chmod +x` to make scripts executable
- Test scripts in a safe environment first
- Use meaningful variable names
- Add comments to explain complex operations
- Handle errors gracefully with proper exit codes

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Add your improvements
4. Submit a pull request

Ideas for contributions:
- Additional examples
- More practice exercises
- Advanced topics
- Performance tips
- Security best practices

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- The open-source community for amazing tools
- Contributors who help improve this resource
- Everyone learning and teaching Bash

## 📞 Support

- **Issues**: Report bugs or request features via GitHub Issues
- **Discussions**: Join our community discussions
- **Wiki**: Check the wiki for additional resources

---

**Happy scripting!** 🐚✨

*Remember: The best way to learn Bash is by practicing. Start with the basics and build up to complex scripts.*