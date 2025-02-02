#!/bin/bash

# Password Cracking with Hashcat

# Check if Hashcat is installed
if ! command -v hashcat &> /dev/null
then
    echo "Hashcat not found. Installing..."
    sudo apt-get update && sudo apt-get install -y hashcat
fi

# Example: MD5 Hash Cracking
HASH_FILE="hashes.txt"
WORDLIST="wordlist.txt"

# Create example hash and wordlist if they don't exist
if [ ! -f "$HASH_FILE" ]; then
    echo -n "password123" | md5sum | awk '{ print $1 }' > $HASH_FILE
fi

if [ ! -f "$WORDLIST" ]; then
    cat <<EOL > $WORDLIST
123456
password
password123
admin
letmein
qwerty
abc123
EOL
fi

# Run Hashcat to crack the password
hashcat -m 0 -a 0 $HASH_FILE $WORDLIST --outfile=cracked.txt --force

# Evaluation
if grep -q "password123" cracked.txt; then
    echo "Password successfully cracked!"
else
    echo "Password not found in wordlist."
fi
