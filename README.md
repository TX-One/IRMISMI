# IRMISMI - IMSI Extraction & Monitoring Framework  

IRMISMI is an advanced script designed to extract IMSI from a target phone number using an internal or external modem on Android (Termux). It leverages AT commands and debugging techniques to bypass restrictions and provides deep network analysis capabilities.  

---

## 📌 Key Features  

✅ Send Flash SMS or standard SMS to the target number  

✅ Extract IMSI from network responses after message transmission  

✅ Automatic detection of internal or external modems  

✅ Attempts to bypass restrictions via Debug Mode & Diag Mode  

✅ Detailed error handling and user feedback  

---

## 📥 Installation  


📖 Refer to [INSTALLATION.md](https://github.com/TX-One/IRMISMI/blob/main/INSTALLATION.md) for a detailed setup guide.


---

🚀 Usage Guide

📖 Refer to USAGE.md for options.


---

🛠 System Requirements

✅ Android device running Termux

✅ Root privileges (for full modem access)

✅ A built-in or external modem supporting AT commands

✅ Enabled Debug Mode or Diag Mode for bypassing restrictions

📖 See REQUIRMENTS.md for full specifications.


---

📊 IMSI Data Analysis with Advanced Tools

Once you obtain an IMSI, various open-source tools can be used for further analysis:

🔹 HLR Lookup - Identify carrier and approximate location.

🔹 CellID & OpenCelliD - Locate a device using network data.

🔹 SS7 Attack Tools - Track location or intercept messages.

🔹 IMSI-Catchers - Capture IMSI using SDR-based techniques.

🔹 SIM Swap Attacks - Hijack accounts using IMSI-based fraud.

📖 Check [USAGE.md](https://github.com/TX-One/IRMISMI/blob/main/USAGE.md) for an in-depth overview.


---

⚠️ Security & Ethical Considerations

🔴 This script is strictly for educational and network security testing purposes.

🔴 Unauthorized use is the sole responsibility of the user.

🔴 The project maintainers hold no liability for misuse.


---

🎯 Troubleshooting & Debugging

💡 If you encounter issues while running the script, consider the following:

🔹 Modem not detected? → Try enabling Debug Mode or Diag Mode.

🔹 AT commands unresponsive? → Ensure the modem supports AT commands.

🔹 IMSI not appearing? → An external modem may be required for more accurate results.

📖 Check [TROUBLESHOOTING.md](https://github.com/TX-One/IRMISMI/blob/main/TROUBLESHOOTING.md) for detailed solutions.


---

🤝 Contributing to the Project

🔹 Have improvements? Submit a Pull Request.
🔹 Encountered an issue? Report it in GitHub Issues.


---

📜 License

🔒 Released under the MIT License. The software is freely available for research and educational purposes, but the developer is not responsible for any illegal use.


---

📞 Support & Contact

📢 Have questions? Reach out through:

🔹 Telegram : https://t.me/TXpOne

🔹 GitHub Issues

---
