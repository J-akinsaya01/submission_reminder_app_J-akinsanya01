#!/bin/bash
#This script below prompts the user to enter his/her name.
read -p "Enter your Name: " username
#The script below creates a directory named `submission_reminder_username` using the username.
mkdir -p submission_reminder_$username
#The script below will create the additional subdirectories.
mkdir submission_reminder_$username/app submission_reminder_$username/modules submission_reminder_$username/assets  submission_reminder_$username/config
#The script below creates the necessary files inside their respective directories.
touch  submission_reminder_$username/app/reminder.sh submission_reminder_$username/modules/functions.sh  submission_reminder_$username/assets/submissions.txt submission_reminder_$username/config/config.env submission_reminder_$username/startup.sh
#The script below input data into the config.env file
cat << 'EOF' > submission_reminder_$username/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
#The script below fills `reminder.sh` with the logic to load configurations and functions.
cat << 'EOF' > submission_reminder_$username/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF
# The script below populates `functions.sh` with helper functions.
cat << 'EOF' > submission_reminder_$username/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF
#Add a sample entry to `submissions.txt`.
cat << 'EOF' > submission_reminder_$username/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Gilbert, Shell Navigation, not submitted
Sheillah, Git, submitted
Karangwa, Shell Navigation, not submitted
Loise, Shell Basics, submitted
Keza, Shell Navigation, not submitted
Shema, Git, submitted
Divin, Shell Navigation, not submitted
Ally, Shell Basics, submitted
EOF
# Giving startup.sh with logic to start the application
cat << 'EOF' > submission_reminder_$username/startup.sh
#!/bin/bash
#This command bellow run the reminder.sh file
./app/reminder.sh
EOF

#Granting execution permissions to `reminder.sh`, `functions.sh`, `config.env`, and `startup.sh`.
chmod +x submission_reminder_$username/app/reminder.sh submission_reminder_$username/modules/functions.sh submission_reminder_$username/config/config.env submission_reminder_$username/startup.sh
# Print success message
echo "Environment setup complete! Your submission reminder app is now ready."
