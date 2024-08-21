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
  ```

- **CentOS/RHEL:**
  ```bash
  sudo yum install curl
  ```

- **Fedora:**
  ```bash
  sudo dnf install curl
  ```

### Run the Script Remotely

To run the script remotely using `curl`, use the following command in your terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/adejaimejr/log-archive/main/log-archive-interactive.sh)
```

This command will download the script and run it directly in your shell, guiding you through the process of setting up the log archiving.

## How It Works

1. **Specify Log Directory**: The script will prompt you to enter the log directory. The default is `/var/log`.
2. **Specify Days to Keep Logs**: You will be asked how many days of logs you want to keep. Logs older than this will be archived and deleted.
3. **Specify Days to Keep Backup Archives**: You will also be asked how long to keep the backup archives. Archives older than this will be automatically deleted.
4. **Run Archiving**: The script will compress the logs, delete the old ones, and clean up any old backup archives based on your settings.
5. **Optional Cron Setup**: After the archiving is completed, the script will ask if you want to set up a cron job for daily execution.

## Manual Installation

If you prefer to install the script manually, you can download it and move it to `/usr/local/bin/`:

```bash
curl -O https://raw.githubusercontent.com/adejaimejr/log-archive/main/log-archive-interactive.sh
chmod +x log-archive-interactive.sh
sudo mv log-archive-interactive.sh /usr/local/bin/log-archive.sh
```

Then, you can run the script with:

```bash
log-archive.sh
```

## License

This project is licensed under the MIT License.
