# About

## Security Update Notification
This bash script is designed to enhance system security by automatically checking for available security updates using Debian's Advanced Package Tool (APT). If updates are detected, the script notifies a designated Slack channel through a webhook. The script includes error handling to manage potential issues during notification delivery and also features logging that records each check and notification result. Additionally, the script is configured to run daily via a cron job, automating the process of security monitoring and ensuring consistent checks without manual intervention.
## License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/DaveRoppo/Cyber-Security/blob/main/LICENSE) file for details
## Acknowledgements
This bash script was inspired by Let's Defend's ["Bash Scripting for Blue Team" course](https://app.letsdefend.io/training/lessons/bash-scripting-for-blue-team)
