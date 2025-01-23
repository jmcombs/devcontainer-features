## OS & Architecture Support

- Debian/Ubuntu Linux distributions with the `apt` package manager.
- `amd64`, `arm64`, and `arm/v7` architectures are supported.

## Configuration

There are two options for using this implementation of the 1Password CLI:

1. [Use service accounts with 1Password CLI](https://developer.1password.com/docs/service-accounts/use-with-1password-cli)
2. [Use 1Password CLI with a Connect server](https://developer.1password.com/docs/connect/connect-cli)

Both require using environment variables. The following are examples of how to set the environment variables for `devcontainer.json`based on which option (from above) is used:

### Service Account

```json
"features": {
    "ghcr.io/jmcombs/devcontainer-features/google-cloud-sdk:latest": {},
    "ghcr.io/jmcombs/devcontainer-features/ngrok:latest": {}
},
...
"containerEnv": {
    "OP_SERVICE_ACCOUNT_TOKEN": "thisismyserviceaccount",
    "OP_CONNECT_HOST": "thisismyconnecthost",
    "OP_CONNECT_TOKEN": "thisismyconnecttoken"
}
```

### Connect Server

```json
"features": {
    "ghcr.io/jmcombs/devcontainer-features/google-cloud-sdk:latest": {},
    "ghcr.io/jmcombs/devcontainer-features/ngrok:latest": {}
},
...
"containerEnv": {
    "OP_CONNECT_HOST": "thisismyconnecthost",
    "OP_CONNECT_TOKEN": "thisismyconnecttoken"
}
```
