#Installation Guide

Prerequisites:

Before installing the tool, ensure that you have:

An Android device with Termux installed.

Root access (for some operations).

A supported internal or external modem.

An active internet connection (for package installations).


Installation Steps

1. Update and Install Dependencies

Open Termux and run the following commands:

apt update && apt upgrade -y

pkg install bash coreutils termux-api -y


2. Grant Storage Permissions

Run the following command to allow Termux to access your device’s storage:

termux-setup-storage


3. Download the Script

Clone the repository or download the script manually:

git clone https://github.com/TX-One/IRMISMI.git

cd IRMISMI


4. Make the Script Executable

Set execution permissions for the script:

chmod +x irmismi.sh


5. Run the Script

Execute the tool by running:

./irmismi.sh



Usage

The script will prompt you to enter a phone number and a custom message.

It will attempt to access the internal modem or detect an external modem.

If Flash SMS fails, it will send a regular SMS.

The tool will monitor cellular activity and extract IMSI details.


Troubleshooting

If you see "[!] Please run this tool on Termux for Android.", make sure you are using Termux.

If the script fails to detect a modem, try connecting an external modem and rerun the tool.

Ensure that root permissions are granted if required for certain operations.


Disclaimer

This tool is intended for educational and testing purposes only. Use it responsibly and comply with all local laws and regulations.


---
