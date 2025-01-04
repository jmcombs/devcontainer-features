#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "gcloud-cli installation" command -v gcloud
check "gcloud-cli version" gcloud --version
check "kubectl installation" command -v kubectl
check "kubectl version" kubectl version --client

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults