#!/bin/bash

# Define hostname, slack webhook, and log file variables
HOSTNAME=$(hostname)
SLACK_WEBHOOK_URL="SLACK_WEBHOOK_URL"
LOG_FILE="/var/log/security_updates_check.log"

# echo initial message to log file to confirm the script ran as scheduled
echo "$(date) - Checking for security updates..." >> $LOG_FILE

# Define security update check function using apt and grep
security_updates() {
    security_updates=$(apt list --upgradable 2>/dev/null | grep -i security)
    # If/then statement to send slack message if an update is available
    if [[ -n $security_updates ]]; then
        message="Pending security updates detected for $HOSTNAME:\n$security_updates"
        send_slack_message "$message"
    # Log all instances where no security update is found
    else
        echo "$(date) - No security updates found." >> $LOG_FILE
    fi
}

# Define slack notification function with error handling and logginf for HTTP 200 response code
send_slack_message() {
    local message="$1"
    response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-type: application/json" \
        --data "{\"text\":\"[$HOSTNAME] $message\"}" "$SLACK_WEBHOOK_URL")
    if [ "$response" -ne 200 ]; then
        echo "$(date) - Failed to send Slack message, HTTP response code: $response" >> $LOG_FILE
    else
        echo "$(date) - Slack message sent successfully." >> $LOG_FILE
    fi
}

security_updates

