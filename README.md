# Log Archive Interactive Script

This repository contains a simple Bash script to archive log files on Linux systems. The script is designed to be user-friendly and interactive, guiding the user through the process of specifying a log directory, determining how many days of logs to keep, and running the archiving process.

## Features

- **Interactive Interface:** The script prompts the user to specify the log directory and the number of days of logs to keep.
- **Automated Archiving:** Logs older than the specified number of days are compressed into a `.tar.gz` file and stored in an archive directory.
- **Cron Job Setup:** The script offers the option to automatically set up a cron job to run the archiving process daily.

## How to Use

### 1. Run the Script Locally

To run the script locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/adejaimejr/log-archive.git
   cd log-archive
