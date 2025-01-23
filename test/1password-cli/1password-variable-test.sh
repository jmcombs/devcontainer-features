#!/bin/bash

set -e

# Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Check if the environment variables are set and match the expected values
check "OP_SERVICE_ACCOUNT_TOKEN is set" [ "$OP_SERVICE_ACCOUNT_TOKEN" = "thisismyserviceaccount" ]
check "OP_CONNECT_HOST is set" [ "$OP_CONNECT_HOST" = "thisismyconnecthost" ]
check "OP_CONNECT_TOKEN is set" [ "$OP_CONNECT_TOKEN" = "thisismyconnecttoken" ]

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults