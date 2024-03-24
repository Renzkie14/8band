#!/bin/sh

# Change permissions for files
chmod 0777 /tmp/zlts10g.sh
chmod 0777 zlts10g.sh

# Remove existing file
rm -rf /tmp/s10gditov3.tgz

# Download file from URL
wget http://raw.github.com/Renzkie14/8band/main/s10gditov3.tgz -O /tmp/s10gditov3.tgz

echo "Checking hash!"
# Calculate MD5 hash
hash=$(md5sum /tmp/s10gditov3.tgz | awk '{print $1}')

# Expected MD5 hash
expected_hash='77b18e489460a990754a7cb2d260740a'

echo "$hash = $expected_hash"
if [ "$hash" = "$expected_hash" ]; then
    echo "Same!"
    # Extract contents of the file
    tar -xvf /tmp/s10gditov3.tgz -C /
    sleep 3
    at_cmd at+zreset
    reboot
else
    echo "Not same!"
fi