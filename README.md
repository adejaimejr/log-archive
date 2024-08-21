## Overview
This script is designed to help you archive logs on a Linux server. It compresses logs older than a specified number of days and stores them in a designated archive directory. Additionally, it can be set up to run automatically at regular intervals using cron.

## Features
- **Interactive CLI**: Guides the user through setting up the log directory and specifying how many days of logs to keep.
- **Automated Archiving**: Compresses logs into `.tar.gz` format and stores them in an archive directory.
- **Cron Integration**: Option to automatically add the script to `crontab` for daily execution.

## Requirements
- Linux-based system
- Bash shell

## Installation

You can execute the script directly from GitHub without needing to download it manually.

### Run the Script Remotely

To run the script remotely, use the following command in your terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/adejaimejr/log-archive/main/log-archive.sh)
