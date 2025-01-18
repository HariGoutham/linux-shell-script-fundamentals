# Linux Fundamentals and Shell Scripting

This README provides an overview of essential concepts in Linux fundamentals, shell scripting, and real-time examples. Understanding these topics is crucial for anyone looking to work effectively in a Linux environment.

## Table of Contents
- [Linux Fundamentals](#linux-fundamentals)
  - [File System Hierarchy](#file-system-hierarchy)
  - [Basic Commands](#basic-commands)
  - [Permissions and Ownership](#permissions-and-ownership)
  - [Process Management](#process-management)
- [Shell Scripting](#shell-scripting)
  - [What is Shell Scripting?](#what-is-shell-scripting)
  - [Basic Syntax](#basic-syntax)
  - [Variables and Data Types](#variables-and-data-types)
  - [Control Structures](#control-structures)
  - [Functions](#functions)
- [Real-Time Examples](#real-time-examples)

## Linux Fundamentals

### File System Hierarchy
The Linux file system is organized in a hierarchical structure, starting from the root directory (`/`). Key directories include:
- `/home`: User home directories.
- `/etc`: Configuration files.
- `/var`: Variable data files, such as logs.
- `/usr`: User programs and utilities.

### Basic Commands
Familiarity with basic Linux commands is essential. Some commonly used commands include:
- `ls`: List directory contents.
- `cd`: Change directory.
- `cp`: Copy files and directories.
- `mv`: Move or rename files and directories.
- `rm`: Remove files or directories.

### Permissions and Ownership
Linux uses a permission model to control access to files and directories. Each file has an owner and a group, with three types of permissions:
- Read (`r`): Permission to read the file.
- Write (`w`): Permission to modify the file.
- Execute (`x`): Permission to execute the file as a program.

You can change permissions using the `chmod` command and change ownership using the `chown` command.

### Process Management
Processes are instances of running programs. Key commands for managing processes include:
- `ps`: Display currently running processes.
- `top`: Display real-time system information and running processes.
- `kill`: Terminate a process by its PID (Process ID).

## Shell Scripting

### What is Shell Scripting?
Shell scripting is a way to automate tasks in a Linux environment by writing scripts that the shell can execute. These scripts can perform a series of commands, making repetitive tasks easier and more efficient.

### Basic Syntax
Shell scripts typically start with a shebang (`#!/bin/bash`) to specify the interpreter. Commands are written in a sequential manner, and comments can be added using the `#` symbol.

### Variables and Data Types
Variables in shell scripts are defined without a type declaration. For example:
```bash
name="John"
echo "Hello, $name"
