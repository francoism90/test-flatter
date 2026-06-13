# Personal Flatpak Repository

A self-hosted Flatpak repository for personal projects and custom applications.

## Directory Structure

```
src/
├── apps/                    # Standalone applications
│   └── com.example.MyApp/
│       ├── com.example.MyApp.yml
│       └── resources/       # Supporting files (screenshots, metainfo, etc.)
│
├── extensions/              # SDK extensions
│   ├── org.freedesktop.Sdk.Extension.podman.yml
│   ├── org.freedesktop.Sdk.Extension.podman.metainfo.xml
│   └── patches/
│       └── 10-podman-compose-syspath.patch
│
└── runtimes/                # Custom runtimes (if needed)
```

## Adding New Packages

### 1. Create a subdirectory or add manifest directly

For apps, create an organized subdirectory:

```
src/apps/com.spotify.Client/
├── com.spotify.Client.yml       # Main manifest
├── resources/
│   ├── com.spotify.Client.metainfo.xml
│   └── any supporting files
```

For extensions or simpler packages, add directly:

```
src/extensions/org.freedesktop.Sdk.Extension.myext.yml
```

### 2. Write or copy your manifest

Flatpak manifests can be in `.yml`, `.yaml`, or `.json` format. The CI will automatically discover and build all of them.

### 3. Include supporting files

Any files referenced in the manifest (like `.metainfo.xml`, patches, etc.) should be in the same directory or subdirectory.

### 4. Push and build

The workflow automatically builds when:

- You push changes to `src/` directory
- Manual trigger via `workflow_dispatch`
- Nightly rebuild (2 AM UTC)

## Publishing Your Repository

Your built packages are hosted on GitHub Pages at:

```
https://<username>.github.io/<repo-name>/
```

Users can add your repository with:

```bash
flatpak remote-add --from https://<username>.github.io/<repo-name>/index.flatpakrepo <name>
flatpak install <name> org.freedesktop.Sdk.Extension.podman
```

## Workflow Triggers

- **Push to main** - Builds when `flatpaks/` or workflow file changes
- **Pull requests** - Builds to test changes (no signing)
- **Manual** - `workflow_dispatch` button in GitHub Actions
- **Scheduled** - Nightly at 2 AM UTC (catches upstream updates)

## GPG Signing

Packages are GPG signed if secrets are configured:

- `GPG_PRIVATE_KEY` - Private key (ASCII-armored)
- `GPG_PASSPHRASE` (optional) - Passphrase for the key

Pull requests skip signing to avoid exposing secrets.

## Example: Adding Spotify with Custom Patches

```
src/apps/com.spotify.Client/
├── com.spotify.Client.yml
├── com.spotify.Client.metainfo.xml
└── patches/
    └── custom-modifications.patch
```

Your manifest would reference patches as relative paths, and the workflow builds everything together.
