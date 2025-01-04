#!/bin/sh
set -e

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

get_architecture() {
    ARCH=$(uname -m)
    case "$ARCH" in
        armhf) echo 'arm' ;;
        armv7) echo 'arm' ;;
        aarch64) echo 'arm64' ;;
        x86_64) echo 'amd64' ;;
        x86) echo '386' ;;
        *) echo >&2 "error: unsupported architecture: $ARCH"; exit 1 ;;
    esac
}

install_ngrok() {
    if command -v ngrok >/dev/null 2>&1; then
        echo "ngrok is already installed"
        return
    fi

    ARCH=$(get_architecture)

    curl -L https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-${ARCH}.tgz --progress-bar -o ngrok-v3-stable-linux-${ARCH}.tgz \
    && tar -xvf ngrok-v3-stable-linux-${ARCH}.tgz \
    && mv ngrok /usr/local/bin/ \
    && rm -f ngrok-v3-stable-linux-${ARCH}.tgz
}

check_dependencies curl ca-certificates
install_ngrok
