# homebrew-tap

Homebrew tap for [shotahirao](https://github.com/shotahirao)'s tools.

## Usage

```bash
brew tap shotahirao/tap
```

## Casks

### [GitHydra](https://github.com/shotahirao/git-hydra)

A simple Git GUI client (Apple Silicon only).

```bash
brew install --cask shotahirao/tap/githydra
```

### [db-fire](https://github.com/shotahirao/db-fire)

A fast, lightweight, cross-platform database client built with Tauri
(Apple Silicon only). Moved here from the deprecated `shotahirao/db-fire` tap.

```bash
brew install --cask shotahirao/tap/db-fire
```

> **Note**: These apps are not notarized by Apple. Each cask removes the
> quarantine attribute automatically after installation, so the apps open
> without the Gatekeeper "damaged app" warning.
