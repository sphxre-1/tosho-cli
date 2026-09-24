# tosho-cli

[![Linux](https://img.shields.io/badge/platform-linux-FCC624?logo=linux&logoColor=black)](https://www.kernel.org)
[![Bash](https://img.shields.io/badge/shell-bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License: Open Source](https://img.shields.io/badge/license-GPLv3-blue.svg)](#license)

A cli anime streaming tool.

Search anime on AniList, resolve seasons via AniMap/AniDB mappings, discover releases on AnimeTosho, and stream through TorBox + mpv. Supports Syncplay for synchronized group watching.


## Dependencies

### Required
- `curl` — API queries and downloads
- `jq` — JSON parsing
- `fzf` — Interactive fuzzy selection
- `mpv` — Video playback
- `socat` — Required for mpv IPC communication and playback control
- `syncplay` — Required for group watching (`--sync`)

## Installation

### Fedora (Recommended)
You can install `tosho-cli` directly from COPR, which will automatically manage dependencies and future updates:
```bash
sudo dnf copr enable sphxre/tosho-cli
sudo dnf install tosho-cli
```

### Universal One-Line Install
For all other Linux distributions (or macOS/Termux), install instantly without `sudo` (installs to `~/.local/bin`):
```bash
curl -sSL https://raw.githubusercontent.com/sphxre-1/tosho-cli/main/install.sh | bash
```

### Manual Compile / System-wide (default `/usr/local/bin`)
```bash
git clone https://github.com/sphxre-1/tosho-cli.git
cd tosho-cli
sudo make install
```

### User-local (`~/.local/bin`)
Make sure `~/.local/bin` is in your `$PATH`:
```bash
make install PREFIX=~/.local
```

### Manual Copy
```bash
cp tosho-cli ~/.local/bin/
chmod +x ~/.local/bin/tosho-cli
```

## Setup

On first run, `tosho-cli` will prompt for your TorBox API key and optional Syncplay settings. Configuration is saved to:
```
~/.config/tosho-cli/config
```

## Usage

```bash
tosho-cli "Frieren"
tosho-cli --sync "One Piece"
tosho-cli --help
```

### Playback Controls
During playback, an interactive menu appears in the terminal. Select with arrow keys/mouse or press the corresponding number:
- `1` — **Next** episode
- `2` — **Replay** current episode
- `3` — **Previous** episode
- `4` — **Select Ep** — pick a specific episode
- `5` — **Quit**

## Configuration

Config file location: `~/.config/tosho-cli/config`

```bash
# Required
TORBOX_KEY="your_torbox_api_key_here"

# Syncplay Settings
SYNCPLAY_SERVER="syncplay.pl:8999"      # host:port
# SYNCPLAY_ROOM="my-unique-room-name"     # Uncomment and set to use --sync
SYNCPLAY_USER="username"                # Defaults to $USER

# Service Endpoints
ANILIST_API_URL="https://graphql.anilist.co"
ANIMETOSHO_URL="https://feed.animetosho.xyz"
ANIMETOSHO_JSON_PATH="/json"
ANIMAP_API_BASE="https://animap.id"
TORBOX_API_BASE="https://api.torbox.app"
TORBOX_API_VERSION="v1"

# TorBox Polling Settings
TORBOX_MAX_WAIT=180                     # Maximum wait time in seconds
TORBOX_POLL_INTERVAL=2                  # Polling interval in seconds

# mpv Preferred Tracks (ISO-639-1 / ISO-639-2)
MPV_AUDIO_LANGS="jpn,ja,eng,en"
MPV_SUB_LANGS="eng,en"
```

## Uninstall

### Fedora (COPR)
```bash
sudo dnf remove tosho-cli
sudo dnf copr disable sphxre/tosho-cli
```

### Manual Install
```bash
# System-wide
sudo make uninstall

# User-local
make uninstall PREFIX=~/.local
```

## License

Open source. Distributed under the GNU General Public License v3.0 (GPLv3).

## Disclaimer
> **Note:** This tool is strictly a metadata aggregator and API client. It does not host, store, or distribute any media files, torrents, or copyrighted content. All data is fetched dynamically from public APIs and third-party services. Users are solely responsible for ensuring their usage of these third-party APIs complies with their local laws and terms of service.
