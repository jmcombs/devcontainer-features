#!/bin/sh
set -e

# Extract 1Password information from environment variables
OP_SERVICE_ACCOUNT_TOKEN=${OPSERVICEACCOUNTTOKEN:-}

check_dependencies() {
    for dep in "$@"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            echo "error: $dep is not installed, attempting to install..."
            if command -v apt-get >/dev/null 2>&1; then
                apt-get update && apt-get install --no-install-recommends -y "$dep"
            else
                echo "error: cannot install $dep, please install it manually" >&2
                exit 1
            fi
        fi
    done
}

install_1pcli() {
    # Add the key for the 1Password apt repository:
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

    # Add the 1Password apt repository:
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
    tee /etc/apt/sources.list.d/1password.list

    # Add the debsig-verify policy:
    mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
    tee /etc/debsig/policies/AC2D62742012EA22/1password.pol && \
    mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 && \
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

    # Install the 1Password CLI:
    apt update && apt install 1password-cli
}

set_op_service_account_token() {
    if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ] ; then
        echo "OP_SERVICE_ACCOUNT_TOKEN is not set. Skipping 1Password Service Account Token setup."
        return 0
    fi
    export $OP_SERVICE_ACCOUNT_TOKEN
}

check_dependencies curl ca-certificates
install_1pcli
set_op_service_account_token