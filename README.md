# Personal Flatpak Repository

A self-hosted Flatpak repository for custom applications, extensions, and runtimes. Built with [Flatter](https://github.com/andyholmes/flatter) and GitHub Actions.

## Features

- 🚀 **Automated CI/CD** - GitHub Actions builds and publishes automatically
- 📦 **Multiple Packages** - Host apps, extensions, and runtimes in one repository
- 🔒 **GPG Signed** - Optional cryptographic signing for security
- 📅 **Scheduled Builds** - Nightly rebuilds catch upstream changes
- 📄 **Static Hosting** - Hosted on GitHub Pages, no server needed
- 🎯 **Easy Setup** - Simple directory structure, just add manifests

## Quick Start

### For Users: Adding This Repository

```bash
# Add the repository
flatpak remote-add --from https://<username>.github.io/<repo>/index.flatpakrepo mycustom

# Install packages
flatpak install mycustom org.freedesktop.Sdk.Extension.podman
```
