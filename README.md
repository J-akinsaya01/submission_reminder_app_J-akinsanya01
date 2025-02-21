Submission Reminder App 

This commit introduces the Submission Reminder App, a Bash-based tool designed to help students track assignment deadlines. It includes scripts and configurations to set up a reminder system.

Installation & Setup:
1. Clone or download the repository:
   ```bash
   git clone https://github.com/J-akinsanya01/submission_reminder_app_J-akinsanya01.git
   
2. Navigate to the script's location in the terminal.
3. Execute the setup script:
   ```bash
   bash create_environment.sh
   # or
   ./create_environment.sh
   
4. Enter your name when prompted.
5. The environment will be set up in a directory named `submission_reminder_<your_name>`. Change to that directory:
   bash
   cd submission_reminder_<your_name>
   
 Usage:
To run the reminder:
1. Inside the directory, execute the reminder script:
   bash
   bash startup.sh
   # or
   ./startup.sh
   
2. The script will display assignment details, remaining days until the deadline, and submission status.
