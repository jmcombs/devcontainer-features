
# google-cloud-sdk (google-cloud-sdk)

Installs the Google Cloud SDK and (optional) additional components.

## Example Usage

```json
"features": {
    "ghcr.io/jmcombs/devcontainer-features/google-cloud-sdk:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| gcloudExtraPackages | Comma-separated list of additional Google Cloud SDK components to install. Example: `google-cloud-cli-app-engine-java,kubectl` | string | - |

## OS & Architecture Support

- Debian/Ubuntu Linux distributions with the `apt` package manager.
- `amd64`, `arm64`, and `arm/v7` architectures are supported.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/jmcombs/devcontainer-features/blob/main/src/google-cloud-sdk/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
