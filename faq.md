Frequently Asked Questions

❓ Can this tool extract IMSI from any phone?

No, the target phone must react to the SMS for IMSI extraction.

❓ What if my phone does not support AT commands?

You will need an external USB modem that supports AT commands.

❓ Does this tool work on iOS?

No, iPhones restrict modem access and do not support this method.

❓ How can I ensure my modem is compatible?

Run:

lsusb | grep -E 'Modem|Huawei|ZTE' 
