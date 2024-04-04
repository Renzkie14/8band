#!/bin/sh

# Set the URL for downloading the tarball
url="http://c5bf0cbf1655937ce4b6291de3ef621c.serveo.net/swd.tar.gz"
# Set the expected MD5 hash value
expected_hash='d96764cbf6b08521ed7944d58b0caba1'
# Set the temporary location for storing the downloaded file
download_location="/tmp/swd.tar.gz"

# Function to safely download the file and check its integrity
download_and_verify() {
    echo "Downloading Files..."
    # Download the file with proper error handling and verification
    if wget --no-check-certificate "$url" -O "$download_location"; then
        # Calculate the MD5 hash of the downloaded file
        hash=$(md5sum "$download_location" | awk '{print $1}')
        echo "Downloaded file MD5 hash: $hash"
        echo "Expected file MD5 hash: $expected_hash"
        # Compare the calculated hash with the expected hash
        if [ "$hash" = "$expected_hash" ]; then
            echo "File integrity verified. Proceeding with upgrade..."
            return 0
        else
            echo "ERROR: Downloaded file hash does not match the expected hash. Aborting upgrade."
            return 1
        fi
    else
        echo "ERROR: Failed to download the file from $url. Aborting upgrade."
        return 1
    fi
}

# Function to perform upgrade actions
perform_upgrade_actions() {
    # Trigger LED indicator
    echo 1 > /sys/class/leds/reset_cp/shot
    # Execute upgrade script
    if sh /lib/cp_upgrade/swdl_linux_notion.sh; then
        echo "Upgrade script executed successfully."
        # Wait for 10 seconds
        sleep 10
        # Trigger LED indicator again
        echo 1 > /sys/class/leds/reset_cp/shot
        # Perform additional actions if needed
        # mtd erase rootfs_data
        # ubus call router router_call_rst_factory 2> /dev/null
        # Reboot the system
        reboot
    else
        echo "ERROR: Upgrade script execution failed. Aborting upgrade."
    fi
}

# Main script execution
if download_and_verify; then
    perform_upgrade_actions
else
    echo "Upgrade process aborted due to errors."
fi