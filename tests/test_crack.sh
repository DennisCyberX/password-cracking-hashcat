```bash
#!/bin/bash

# Test if the password cracking script works

bash scripts/crack_passwords.sh > output.log

if grep -q "Password successfully cracked!" output.log; then
    echo "Test Passed: Password was cracked."
    exit 0
else
    echo "Test Failed: Password not cracked."
    exit 1
fi
