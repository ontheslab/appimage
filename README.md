# NABU PC MAME AppImage Builds

**AppImage** builds of **NABU PC MAME (r0.250+)** for 64-bit Linux, with an integrated NABU network server running as a background process. Designed for the **Steam Deck** but works on most modern Linux distros (tested on Linux Mint and WSL2).

Each AppImage is a self-contained executable — no installation, no external dependencies.

---

## AppImage Variants

| AppImage | Bundled Servers | Status |
| -------- | --------------- | ------ |
| **NABUPcAIO.AppImage** | NIA + NNS + CoCo FujiNet — all three in one, choose at launch | Current |
| **NABUPcNIA.AppImage** | NABU Internet Adapter (NIA) by DJ Sures — connects to nabu.ca retronet | Superseded by NABUPcAIO |
| **NABUPcNNS.AppImage** | NABU NetSim (NNS) by Nick Daniels (GryBsh) — advanced local simulator | Superseded by NABUPcAIO |
| **NABUPcTEST.AppImage** | CoCo FujiNet server — 8-bit networking for CoCo3 via localhost | Superseded by NABUPcAIO |

Download from [Releases](https://github.com/ontheslab/appimage/releases).

---

## Quick Start

```bash
chmod +x NABUPcAIO.AppImage
./NABUPcAIO.AppImage
```

By default MAME connects directly to nabu.ca using its built-in `hcca_remote` connection — no server setup needed. Add `--server nia` or `--server nns` to use a bundled server instead.

---

## NABUPcAIO Options

All flags prefixed with `--` are handled by the AppImage and stripped before anything is passed to MAME.

| Flag | Effect |
| ---- | ------ |
| `--help` | Show available options and exit |
| `--about` | Display the bundled release notes and exit |
| `--debug` | Show all script and MAME command output |
| `--server <name>` | Server: `none` (default), `nia`, `nns`, `fuji` |
| `--fuji` | Shorthand for `--server fuji` |
| `--nonia` | Shorthand for `--server none` |
| `--nonns` | Shorthand for `--server none` |
| `--mame` | MAME only — pass a fully custom MAME command (exclusive) |
| `--coleco` | Launch built-in Coleco ROM collection (brijohn's coleco.npz) |
| `--config` | Open server config UI (NIA: GUI window, exits when closed; NNS/FujiNet: prints URL, press Enter to stop) |
| `--reset` | Back up config folders to `.old` and regenerate defaults |

Any additional arguments are passed directly to MAME.

**Default MAME command (no options):**

```text
nabupc -noswitchres -resolution 1024x768 -nabu_video tms9938 -hcca hcca_remote
```

### Examples

```bash
# Default — MAME connects directly to nabu.ca via hcca_remote
./NABUPcAIO.AppImage

# NIA server + MAME
./NABUPcAIO.AppImage --server nia

# Local NNS simulator with web UI
./NABUPcAIO.AppImage --server nns --config

# CoCo FujiNet session (requires CoCo3 ROMs — see below)
./NABUPcAIO.AppImage --server fuji

# Built-in Coleco ROM collection
./NABUPcAIO.AppImage --coleco

# Custom MAME command — connect to a server on your local network
./NABUPcAIO.AppImage --mame nabupc -noswitchres -resolution 1024x768 -nabu_video tms9938 -hcca null_modem -bitb socket.192.168.0.10:5816

# Reset config to defaults
./NABUPcAIO.AppImage --reset
```

---

## Bonus Cores — Vectrex and CoCo3

The bundled MAME binary also includes **Vectrex** and **CoCo3 / CoCo3h** emulation. Place your own ROM files in `~/.mamedata/roms/<system>/` before use. Use `--mame` to run these cores.

### Vectrex

```bash
# Built-in Mine Storm
./NABUPcAIO.AppImage --mame vectrex -window -rompath ~/.mamedata/roms

# With a cartridge
./NABUPcAIO.AppImage --mame vectrex -window -rompath ~/.mamedata/roms -cart ~/.mamedata/roms/vectrex/scramble.zip
```

### CoCo3 / CoCo3h

- `coco3` — Motorola 6809 CPU (original hardware)
- `coco3h` — Hitachi HD6309 CPU (faster; use for HD6309 software)

```bash
# BASIC prompt, no disk
./NABUPcAIO.AppImage --mame coco3 -window -rompath ~/.mamedata/roms

# With a floppy disk image
./NABUPcAIO.AppImage --mame coco3h -window -rompath ~/.mamedata/roms -ramsize 512k -flop1 ~/Documents/coco/GUNSTAR.DSK
```

For **CoCo FujiNet** (network/SD card), use `--server fuji` instead. See [docs/NABUPcAIO.md](docs/NABUPcAIO.md) for full details.

---

## File Locations

All user data is created automatically on first run and rebuilt if deleted.

| Path | Contents |
| ---- | -------- |
| `~/.mamedata/cfg` | MAME config files (nabupc, coco3, vectrex) |
| `~/.mamedata/roms` | ROM files (user-supplied for CoCo3/Vectrex) |
| `~/.mamedata/disks` | Disk images |
| `~/Pictures/nabupc` | NABU PC screenshots |
| `~/Documents/NABU Internet Adapter/` | NIA binary and config (upgradeable) |
| `~/.nns/` | NNS runtime data |
| `~/Documents/FujiNetCoCo/` | FujiNet data and SD card files |

**NIA** can be updated independently by dropping a new binary into `~/Documents/NABU Internet Adapter/`.

**NNS** is a fixed version (latest SD-5 WIP). **FujiNet** is fixed at v1.5.1+git-d7fd2d2fa.

The NIA `config.xml` is automatically updated if you're running on a non-Steam Deck system (replaces `/home/deck` with your actual `$HOME`).

---

## Steam Deck Controller Setup

MAME uses keyboard/joystick mapping from GTAMP's Windows distribution. Set up a custom controller layout in the Steam Deck menus to map keys like **ESC**, **F3**, **F12**, and **TAB**. The MAME UI (TAB key) is active by default.

---

## Docs

Full release notes and detailed usage for each build are in the [docs/](docs/) folder.

---

## Acknowledgements

DJ Sures (NIA), GryBsh/Nick Daniels (NNS), GTAMP, brijohn (MAME NABU source & Coleco ROMs), LaBomb, The FujiNet Team, Leo. Special thanks to Leo and DJ without whom none of this would exist.

**Reference Links:**

- [gtamp.com/nabu](https://gtamp.com/nabu/)
- [nabu.ca/cloud-cpm](https://nabu.ca/cloud-cpm)
- [GryBsh/NabuNetSim](https://github.com/GryBsh/NabuNetSim)
- [brijohn/nabupc](https://github.com/brijohn/nabupc)
- [labomb/NABU_PC_Stuff](https://github.com/labomb/NABU_PC_Stuff)
- [linuxplayground/nabu-games](https://github.com/linuxplayground/nabu-games)
- [fujinet.online](https://fujinet.online)
- [FujiNetWIFI/fujinet-firmware](https://github.com/FujiNetWIFI/fujinet-firmware)

> **Note:** These builds are experimental. The only thing guaranteed is they _might_ break your system! ;-)

---

_This repo was tidied up and brought properly to GitHub with a little help from [Claude](https://claude.ai/code) — our first adventure together!_ 🤖
