# NABUPcAIO — All-In-One AppImage

**Version 1.01** — NABU PC MAME with NIA, NNS and CoCo FujiNet in a single AppImage for Steam Deck & Linux.

The all-in-one AppImage bundles MAME and all three supported NABU servers together. Choose your server at launch — no separate downloads or installs required.

---

## Bundled Servers

| Server | Version | Author | Description |
| ------ | ------- | ------ | ----------- |
| **NIA** | NABU-Internet-Adapter-84 | DJ Sures | Connects to nabu.ca retronet. Default server, runs headless. |
| **NNS** | v1.3.4-release5 | Nick Daniels (GryBsh) | Local advanced NABU simulator. Web UI at `http://localhost:5000` |
| **FujiNet** | v1.5.1 | FujiNet Team | CoCo3 8-bit networking via MAME. Web UI at `http://localhost:8000` |

---

## Quick Start

```bash
./NABUPcAIO.AppImage                    # NIA + MAME (default)
./NABUPcAIO.AppImage --server nns       # NNS + MAME
./NABUPcAIO.AppImage --server fuji      # CoCo FujiNet + MAME
./NABUPcAIO.AppImage --server none      # MAME only
```

---

## Options

| Option | Description |
| ------ | ----------- |
| `--help` | Display full help and exit |
| `--server <name>` | Server to run: `nia` (default), `nns`, `fuji`, `none` |
| `--fuji` | Shorthand for `--server fuji` |
| `--nonia` | Shorthand for `--server none` |
| `--nonns` | Shorthand for `--server none` |
| `--coleco` | Run built-in Coleco ROM collection (brijohn) |
| `--config` | Open server config UI (NIA: GUI window; NNS/FujiNet: web browser) |
| `--reset` | Reset all configs to defaults, back up existing to `.old` |
| `--debug` | Enable debug output |
| `--about` | Display the bundled readme |

Additional arguments are passed directly to MAME.

---

## Data File Locations

| Path | Contents |
| ---- | -------- |
| `~/.mamedata/` | MAME configuration, ROMs, disks |
| `~/Pictures/nabupc/` | MAME screen captures |
| `~/Documents/NABU Internet Adapter/` | NIA binary and config |
| `~/.nns/` | NNS runtime data (created on first run) |
| `~/Documents/FujiNetCoCo/` | FujiNet binary and config |

All folders are created automatically on first run. Use `--reset` to restore defaults (existing configs backed up to `.old`).

- **NIA** can be upgraded by replacing the binary in `~/Documents/NABU Internet Adapter/`
- **NNS** is a fixed bundled version (v1.3.4-release5)
- **FujiNet** can be updated by replacing the contents of `~/Documents/FujiNetCoCo/`

---

## Examples

```bash
# Standard retronet session via nabu.ca
./NABUPcAIO.AppImage

# Local NNS simulator with web UI open for config
./NABUPcAIO.AppImage --server nns --config

# CoCo FujiNet session
./NABUPcAIO.AppImage --server fuji

# MAME only, connect to a server on your local network
./NABUPcAIO.AppImage --server none nabupc -noswitchres -resolution 1024x768 \
  -nabu_video tms9938 -hcca null_modem -bitb socket.192.168.0.10:5816

# Coleco ROM collection (built-in, no server needed)
./NABUPcAIO.AppImage --coleco

# Debug mode — shows all internal steps
./NABUPcAIO.AppImage --debug
```

---

## Platform

Linux 64-bit. Targeted at Steam Deck. Tested on Linux Mint and WSL2.

This is an AppImage — a self-contained executable with all required libraries included.

---

## Acknowledgements

This AppImage contains contributions from and the very hard work of:
**DJ Sures** (NIA), **Nick Daniels / GryBsh** (NNS), the **FujiNet Team**, **GTAMP**, **brijohn**, **LaBomb**, **Leo** and the wider NABU community.

Built with assistance from [Claude](https://claude.ai) (Anthropic) — our first adventure together in proper version-controlled NABU development.
