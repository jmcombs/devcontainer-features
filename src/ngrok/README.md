
# ngrok (ngrok)

Globally distributed reverse proxy that secures, protects and accelerates your applications and network services, no matter where you run them.

## Example Usage

```json
"features": {
    "ghcr.io/jmcombs/devcontainer-features/ngrok:1": {}
}
```



## Configuration of `authtoken`

Features are installed inside devcontainers using the `root` user, but `ngrok` configuration is user-specific. When running devcontainers, a non-root user is typically used. It is recommended to use `postCreateCommand` and `remoteUser` to set the `authtoken`.

**NOTE:** It is recommended to use the `NGROK_AUTH_TOKEN` environment variable to store the `authtoken` securely and avoid storing it in the `devcontainer.json` file.

```json
  // Non-root user for Dev Container
  "remoteUser": "coder",
  // Post create command to add ngrok authtoken
  "postCreateCommand": "ngrok config add-authtoken $NGROK_AUTH_TOKEN"
```

## OS & Architecture Support

- Debian/Ubuntu Linux distributions with the `apt` package manager.
- `amd64`, `arm64`, and `arm/v7` architectures are supported.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/jmcombs/devcontainer-features/blob/main/src/ngrok/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
