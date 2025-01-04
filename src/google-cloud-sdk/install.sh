#!/bin/sh
set -e

# Install dependencies
apt-get update && apt-get install -y --no-install-recommends apt-transport-https ca-certificates gnupg curl

# Add the Cloud SDK distribution URI as a package source
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Extract gcloudExtraPackages from environment variables
GCLOUD_EXTRA_PACKAGES=${GCLOUDEXTRAPACKAGES:-}
GCLOUD_EXTRA_PACKAGES=$(echo $GCLOUD_EXTRA_PACKAGES | tr ',' ' ')

# Check if the OS is Ubuntu 24.04 and the architecture is arm64, and exit with a message if true
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "ubuntu" ] && [ "$VERSION_ID" = "24.04" ] && [ "$(uname -m)" = "aarch64" ]; then
        echo "Installing google-cloud-cli 502.0.0-0 on Ubuntu 24.04 on arm64 architecture due to https://issuetracker.google.com/issues/383568269."
        apt-get update && apt-get install -y google-cloud-cli=502.0.0-0 ${GCLOUD_EXTRA_PACKAGES}
        exit 0
    fi
fi

# Update and install the Google Cloud SDK
apt-get update && apt-get install -y google-cloud-cli ${GCLOUD_EXTRA_PACKAGES}
