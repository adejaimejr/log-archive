#!/bin/bash

# Function to prompt for user input with a default option
prompt_for_input() {
    read -r -p "$1 [$2]: " input
    echo "${input:-$2}"
}

# Main interactive loop
while true; do
    echo "1. Specify Log Directory"
    echo "2. Specify Number of Days to Keep Logs"
    echo "3. Specify Number of Days to Keep Backup Archives"
    echo "4. Run Log Archiving Process"
    echo "5. Exit"
    echo ""

    read -r -p "Choose an option [1-5]: " choice

    case $choice in
        1)
            log_dir=$(prompt_for_input "Enter the log directory" "/var/log")
            if [ ! -d "$log_dir" ]; then
                echo "Error: Log directory does not exist."
                log_dir=""
            else
                echo "Log directory set to $log_dir"
            fi
            ;;
        2)
            days_to_keep_logs=$(prompt_for_input "How many days of logs do you want to keep?" "7")
            echo "Logs older than $days_to_keep_logs days will be archived."
            ;;
        3)
            days_to_keep_backups=$(prompt_for_input "How many days of backup archives do you want to keep?" "30")
            echo "Backup archives older than $days_to_keep_backups days will be deleted."
            ;;
        4)
            if [ -z "$log_dir" ]; then
                echo "Error: Log directory is not set. Please set it first."
            else
                # Archive directory
                archive_dir="$log_dir/archive"
                mkdir -p "$archive_dir"

                # Name of the archive file
                timestamp=$(date +"%Y%m%d_%H%M%S")
                archive_file="$archive_dir/logs_archive_$timestamp.tar.gz"

                # Find and compress logs older than specified days
                find "$log_dir" -type f -mtime +$days_to_keep_logs -print0 | tar -czvf "$archive_file" --null -T -

                # Log the archiving process
                echo "Logs archived in $archive_file on $(date)" >> "$archive_dir/archive_log.txt"

                # Delete logs older than the specified number of days
                find "$log_dir" -type f -mtime +$days_to_keep_logs -exec rm -f {} \;

                echo "Archiving completed: $archive_file"

                # Delete backup archives older than specified days
                find "$archive_dir" -type f -name "*.tar.gz" -mtime +$days_to_keep_backups -exec rm -f {} \;
                echo "Backup archives older than $days_to_keep_backups days have been deleted."
            fi
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please choose a number between 1 and 5."
            ;;
    esac
done

# Setup cron job function
setup_cron() {
    read -r -p "Do you want to add this script to cron for daily execution? (y/n) " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
        cron_line="0 2 * * * /usr/local/bin/log-archive.sh"
        (crontab -l 2>/dev/null; echo "$cron_line") | crontab -
        echo "Cron job added: $cron_line"
    else
        echo "Cron job not added."
    fi
}

# Call the cron setup function
setup_cron
