#!/bin/sh
set -e

# Check if the OS is Ubuntu 24.04 and exit with a message if true
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "ubuntu" ] && [ "$VERSION_ID" = "24.04" ]; then
        echo "This feature does not support Ubuntu 24.04 due to a Python version conflict."
        exit 1
    fi
fi

# Install dependencies
apt-get update && apt-get install -y --no-install-recommends apt-transport-https ca-certificates gnupg curl

# Add the Cloud SDK distribution URI as a package source
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Update and install the Google Cloud SDK
apt-get update && apt-get install -y google-cloud-cli ${GCLOUD_EXTRA_PACKAGES}
