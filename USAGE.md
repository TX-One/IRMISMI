How to Use the Tool

🔹 Step 1: Launch the Tool

Run the tool in Termux with root privileges:

tsu ./imsi-extract.sh 

🔹 Step 2: Enter Target Details

• Enter the target phone number

• Choose a custom fallback SMS message

🔹 Step 3: Modem Detection

• Internal Modem? ✅ Checks for available /dev/tty* devices

• Debug Mode Activation? 🔄 Attempts to enable hidden modems

• Diag Mode Activation? 🔄 Uses Qualcomm’s diag,adb setting

• External Modem? ✅ Detects connected USB modems

🔹 Step 4: Send Flash SMS & Log Network Activity

• If Flash SMS fails, the tool sends a regular SMS

• Network activity is monitored for IMSI responses

🔹 Step 5: Extract IMSI

• The log is analyzed, and IMSI is extracted
🔹 Advanced IMSI Analysis & Security Risks


IMSI-Based Location Tracking & Data Analysis

📌 HLR Lookup Services & Open-Source HLR APIs

IMSI is tied to a mobile network operator, making it possible to track and analyze subscriber data using HLR (Home Location Register) lookup services.

Potential Threats:

• Identifying the victim’s carrier

• Determining the general geographic location

• Checking if the target number is active or deactivated

Available Tools & Services:

• HLR Lookup APIs (e.g., Numverify, HLR Lookup Pro)

• Open-source tools like HlrLookup on GitHub

Use Cases:
✔️ Identifying the network provider of a phone number
✔️ Checking if a phone number is valid and active, which can aid in SIM Swap or social engineering attacks

📌 CellID & OpenCelliD - IMSI-Based Location Tracking

Using IMSI, attackers can determine a phone’s approximate location by mapping it against cell tower databases.

Potential Threats:

• IMSI + Cell ID data can be used to triangulate a phone’s physical location

• Network logs combined with OpenCelliD APIs can reveal movement patterns

Available Tools:

• OpenCelliD API → Queries Cell ID & MCC/MNC data

• gsmmap.org → Analyzes cellular security vulnerabilities

• LTE Cell Scanners (SDR-Based Tools) → Extracts local cell tower data

Use Cases:
✔️ Approximate location tracking using IMSI & network data
✔️ Mapping cellular tower footprints for further analysis

2️⃣ IMSI-Based Attacks & Deep Network Exploits

📌 SS7 Attack Tools - IMSI Exploitation for Location Tracking & Interception

The SS7 protocol (Signaling System No. 7) is a telecom backbone that allows network operators to communicate. However, it has serious vulnerabilities that allow attackers to:

• Track a target's physical location using IMSI

• Intercept SMS messages and calls, enabling 2FA bypass

• Remotely register a device on another network (forcing the victim onto an attacker-controlled relay)

Available Tools:

• SS7MAPer (GitHub) → Requires SS7 network access

• SIGploit → Exploits SS7, Diameter & GTP vulnerabilities

• Osmocom SS7 → Open-source SS7 security analysis tools

Use Cases:
✔️ Pinpointing a victim’s exact location via SS7 queries
✔️ Intercepting SMS-based OTP codes for hacking accounts

📌 IMSI-Catcher Attacks using SDR (Software-Defined Radio)

With an IMSI number, attackers can deploy an IMSI Catcher—a fake cell tower that forces nearby devices to connect.

Potential Threats:

• Forcing target phones to connect to an attacker-controlled base station

• Intercepting SMS & voice calls by forcing 2G/GSM connections

• Logging all device IMSI numbers in a given area

Available Tools:

• srsRAN (formerly srsLTE) → Builds fake LTE networks

• BladeRF/HackRF + OpenBTS/OpenLTE → Creates false base stations

• IMSI Catcher Detection Apps (e.g., AIMSICD) → Detects active IMSI Catchers

Use Cases:
✔️ Forcing victim devices onto an attacker-controlled network
✔️ Conducting downgrade attacks to exploit older, insecure cellular standards

📌 SIM Swap Attacks - Exploiting IMSI for Identity Theft

Attackers who possess a victim’s IMSI can bypass mobile authentication by tricking the carrier into porting the number to a new SIM card.

Potential Threats:

• Hijacking phone numbers for account takeovers

• Intercepting banking codes & OTPs

• Gaining access to social media & email accounts

Available Tools & Techniques:

• Recon-ng → Gathers target intelligence for social engineering

• Automated social engineering scripts → Used for carrier fraud

• Maltego & OSINT tools → Maps accounts linked to phone numbers

Use Cases:
✔️ Stealing social media, email, and financial accounts
✔️ Bypassing 2FA security protections via SMS interception

3️⃣ Protecting Against IMSI-Based Attacks

If an attacker obtains your IMSI, they can:
✅ Analyze your location using HLR lookup & OpenCelliD
✅ Execute SS7 attacks to pinpoint your real-time location & intercept messages
✅ Deploy IMSI Catchers to track and manipulate your phone’s network connection
✅ Perform SIM swap attacks to take over your accounts

🛡️ How to Protect Yourself

✔️ Use a 5G SA (Standalone) device, as modern 5G networks prevent IMSI exposure
✔️ Disable 2G networks in your phone settings (if supported)
✔️ Use VoLTE-Only Mode to avoid legacy network vulnerabilities
✔️ Switch to app-based 2FA (Google Authenticator, Authy) instead of SMS-based authentication
✔️ Monitor account activity for unusual login attempts linked to your phone number

📌 Final Thoughts

The IMSI Extraction Framework allows users to study and understand cellular vulnerabilities. However, it also highlights the dangers of IMSI exposure. This section serves as an educational resource to:

• Raise awareness about real-world IMSI exploitation

• Help security researchers develop better detection & prevention methods

• Encourage responsible and ethical use of IMSI-related tools

🚀 Want to contribute? Join our GitHub discussions to help improve IMSI security research!

📄 Summary of Changes & Enhancements

✅ Added a new "Advanced IMSI Analysis & Security Risks" section under usage.md
✅ Structured content to cover IMSI-based tracking, attacks, and defenses
✅ Provided real-world tools & attack vectors for educational awareness
✅ Included cybersecurity best practices to mitigate IMSI exploitation risks
