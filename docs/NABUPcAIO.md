# NABUPcAIO — All-In-One AppImage

**Version 1.02** — NABU PC MAME with NIA, NNS and CoCo FujiNet in a single AppImage for Steam Deck & Linux.

The all-in-one AppImage bundles MAME and all three supported NABU servers together. Choose your server at launch — no separate downloads or installs required.

By default (no options) MAME connects directly to nabu.ca using its built-in hcca_remote connection — no bundled server needed.

---

## Bundled Servers

| Server | Version | Author | Description |
| ------ | ------- | ------ | ----------- |
| **NIA** | NABU-Internet-Adapter-84 | DJ Sures | Connects to nabu.ca retronet. Runs headless. |
| **NNS** | v1.3.4-release5 | Nick Daniels (GryBsh) | Local advanced NABU simulator. Web UI at `http://localhost:5000` |
| **FujiNet** | v1.5.1 | FujiNet Team | CoCo3 8-bit networking via MAME. Web UI at `http://localhost:8000` |

---

## Quick Start

```bash
./NABUPcAIO.AppImage                    # MAME direct to nabu.ca via hcca_remote (default)
./NABUPcAIO.AppImage --server nia       # NIA + MAME
./NABUPcAIO.AppImage --server nns       # NNS + MAME
./NABUPcAIO.AppImage --server fuji      # CoCo FujiNet + MAME
```

---

## Options

| Option | Description |
| ------ | ----------- |
| `--help` | Display full help and exit |
| `--server <name>` | Server to run: `none` (default), `nia`, `nns`, `fuji` |
| `--fuji` | Shorthand for `--server fuji` |
| `--nonia` | Shorthand for `--server none` (no server) |
| `--nonns` | Shorthand for `--server none` (no server) |
| `--mame` | MAME only — pass your own command directly (exclusive) |
| `--coleco` | Run built-in Coleco ROM collection (brijohn) |
| `--config` | Open server config UI (NIA: GUI window, exits when closed; NNS/FujiNet: prints URL, press Enter to stop) |
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
# Default — MAME connects directly to nabu.ca via hcca_remote
./NABUPcAIO.AppImage

# NIA server + MAME — nabu.ca session via bundled NIA
./NABUPcAIO.AppImage --server nia

# NNS config — server starts, prints URL, press Enter to stop
./NABUPcAIO.AppImage --server nns --config

# CoCo FujiNet session
./NABUPcAIO.AppImage --server fuji

# MAME only with fully custom command, connecting to a local server
./NABUPcAIO.AppImage --mame nabupc -noswitchres -resolution 1024x768 -nabu_video tms9938 -hcca null_modem -bitb socket.192.168.0.10:5816

# Coleco ROM collection (built-in, no server needed)
./NABUPcAIO.AppImage --coleco

# Debug mode — shows all internal steps
./NABUPcAIO.AppImage --debug
```

---

## Bonus Cores — Vectrex and CoCo3

The bundled MAME binary includes Vectrex and CoCo3 / CoCo3h emulation in addition to NABU PC. Place your own ROM files in `~/.mamedata/roms/<system>/` before use.

Use `--mame` for all bonus core sessions — this bypasses all servers and passes your command directly to MAME.

### Vectrex

```bash
# Basic launch — BIOS screen / built-in Mine Storm
./NABUPcAIO.AppImage --mame vectrex -window -rompath ~/.mamedata/roms

# With a cartridge
./NABUPcAIO.AppImage --mame vectrex -window -rompath ~/.mamedata/roms -cart ~/.mamedata/roms/vectrex/scramble.zip

# Debug mode — confirm what is passed to MAME
./NABUPcAIO.AppImage --debug --mame vectrex -window -rompath ~/.mamedata/roms
```

### CoCo3 and CoCo3h

Two CoCo3 variants are available:

| Core | CPU | Use when |
| ---- | --- | -------- |
| `coco3` | Motorola 6809 (original) | General use |
| `coco3h` | Hitachi HD6309 (faster) | HD6309-specific software |

```bash
# Basic launch — BASIC prompt, no disk
./NABUPcAIO.AppImage --mame coco3 -window -rompath ~/.mamedata/roms

# With a floppy disk image (.DSK)
./NABUPcAIO.AppImage --mame coco3h -window -rompath ~/.mamedata/roms -ramsize 512k -flop1 ~/Documents/coco/GUNSTAR.DSK

# With multiple disk images
./NABUPcAIO.AppImage --mame coco3h -window -rompath ~/.mamedata/roms -ramsize 512k -flop1 ~/Documents/coco/DISK1.DSK -flop2 ~/Documents/coco/DISK2.DSK
```

> For CoCo FujiNet (network/SD card access), use `--server fuji` instead — see the Quick Start section.

---

## Platform

Linux 64-bit. Targeted at Steam Deck. Tested on Linux Mint and WSL2.

This is an AppImage — a self-contained executable with all required libraries included.

---

## Acknowledgements

This AppImage contains contributions from and the very hard work of:
**DJ Sures** (NIA), **Nick Daniels / GryBsh** (NNS), the **FujiNet Team**, **GTAMP**, **brijohn**, **LaBomb**, **Leo** and the wider NABU community.

Built with assistance from [Claude](https://claude.ai) (Anthropic) — our first adventure together in proper version-controlled NABU development.
