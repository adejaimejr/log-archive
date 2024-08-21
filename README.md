# Log Archive Script

## Overview

This script is designed to help you manage logs on a Linux server by archiving old logs, deleting them after archiving, and managing the storage of these backups. It helps keep your server clean and organized by preventing the accumulation of outdated logs and backup archives.

## Features

- **Interactive CLI**: Guides the user through setting up the log directory, specifying how many days of logs to keep, and how long to retain backup archives.
- **Automated Archiving**: Compresses logs into `.tar.gz` format and stores them in an archive directory.
- **Automatic Cleanup**: Deletes old logs after they have been archived and also deletes backup archives that are older than a specified number of days.
- **Cron Integration**: Option to automatically add the script to `crontab` for daily execution.

## Benefits

- **Improves Server Performance**: By regularly archiving and cleaning up old logs, you free up disk space and keep your server running efficiently.
- **Easy to Use**: The interactive CLI makes it simple for users of all skill levels to configure and run the script.
- **Flexible Retention Policies**: You can specify how long to keep logs and backup archives, allowing you to customize the script to your specific needs.

## Requirements

- Linux-based system
- Bash shell
- `curl` installed

## Installation

### Install `curl` (if not installed)

If `curl` is not installed on your Linux system, you can install it using the following commands:

- **Debian/Ubuntu:**
  ```bash
  sudo apt update
  sudo apt install curl
