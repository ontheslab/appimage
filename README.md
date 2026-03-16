# NABU PC MAME AppImage Builds

**AppImage** builds of **NABU PC MAME (r0.250+)** for 64-bit Linux, with an integrated NABU network server running as a background process. Designed for the **Steam Deck** but works on most modern Linux distros (tested on Linux Mint and WSL2).

Each AppImage is a self-contained executable — no installation, no external dependencies.

---

## AppImage Variants

| AppImage | Bundled Server | Status |
| -------- | -------------- | ------ |
| **NABUPcNIA.AppImage** | NABU Internet Adapter (NIA) by DJ Sures — connects to nabu.ca retronet | Current |
| **NABUPcNNS.AppImage** | NABU NetSim (NNS) by Nick Daniels (GryBsh) — advanced local simulator | Current |
| **NABUPcTEST.AppImage** | CoCo FujiNet server — 8-bit networking for CoCo3 via localhost | Alpha |

Download from [Releases](https://github.com/ontheslab/appimage/releases).

---

## Quick Start

```bash
chmod +x NABUPcNIA.AppImage
./NABUPcNIA.AppImage
```

That's it. The bundled server starts automatically in the background, MAME launches in 80-column mode connected to it, and cleans up on exit.

---

## Options

All three AppImages share the same flag structure. Flags prefixed with `--` are handled by the AppImage and stripped before anything is passed to MAME.

| Flag | Effect |
| ---- | ------ |
| `--help` | Show available options and exit |
| `--about` | Display the bundled release notes and exit |
| `--debug` | Show all script and MAME command output |
| `--nonia` | Skip NIA server (NABUPcNIA only) |
| `--nonns` | Skip NNS server (NABUPcNNS only) |
| `--coleco` | Launch built-in Coleco ROM collection (brijohn's coleco.npz) |
| `--fuji` | Launch CoCo FujiNet server and MAME as coco3 (NABUPcTEST only) |
| `--reset` | Back up config folders to `.old` and regenerate defaults, then exit |

Any additional arguments are passed directly to MAME.

**Default MAME command (when no options given):**

```text
nabupc -resolution 1024x768 -nabu_video tms9938 -hcca null_modem -bitb socket.127.0.0.1:5816
```

### Examples

```bash
# Connect to an external server instead of the bundled one
./NABUPcNIA.AppImage --nonia nabupc -window -nabu_video tms9938 -hcca null_modem -bitb socket.192.168.0.211:5816

# Run with debug output to see exactly what's being passed to MAME
./NABUPcNIA.AppImage --debug

# Launch the built-in Coleco ROM collection (no server needed)
./NABUPcNIA.AppImage --nonia --coleco

# Load a local NPZ file
./NABUPcNNS.AppImage --nonns --debug nabupc -window -hcca hcca_local -npz ~/Documents/nabu/Digger.npz

# Reset config to defaults (run once after upgrading from an older AppImage)
./NABUPcNIA.AppImage --reset
```

---

## Additional Cores (CoCo3, Vectrex, FujiNet)

The MAME binary includes **CoCo3** (6809 & 6309), **Vectrex**, and in the TEST build, **CoCo FujiNet** support. ROM files for these are **not included** and must be placed in `~/.mamedata/roms/<system>/`.

```bash
# Vectrex
./NABUPcNIA.AppImage --nonia --debug vectrex -window -rompath ~/.mamedata/roms

# CoCo3 with disk image
./NABUPcNIA.AppImage --nonia --debug coco3h -rompath ~/.mamedata/roms -ramsize 512k -flop1 ~/Documents/coco/GUNSTAR.DSK

# CoCo FujiNet (TEST build — requires coco3.rom, disk10.rom, hdbdw3bc3.rom in ~/.mamedata/roms/coco3/)
./NABUPcTEST.AppImage --fuji
```

See [docs/NABUPcTEST.md](docs/NABUPcTEST.md) for full CoCo FujiNet setup and usage.

---

## File Locations

All user data is created automatically on first run and rebuilt if deleted.

| Path | Contents |
| ---- | -------- |
| `~/.mamedata/cfg` | MAME config files (nabupc, coco3, vectrex) |
| `~/.mamedata/roms` | ROM files (user-supplied for CoCo3/Vectrex) |
| `~/.mamedata/disks` | Disk images |
| `~/Pictures/nabupc` | NABU PC screenshots |
| `~/Documents/NABU Internet Adapter/` | NIA binary and config (NIA builds) |
| `~/.nns/` | NNS runtime data (NNS builds) |
| `~/Documents/FujiNetCoCo/` | FujiNet data and SD card files (TEST build) |

**NIA** can be updated independently by dropping a new binary into `~/Documents/NABU Internet Adapter/`.

**NNS** is a fixed version (latest SD-5 WIP). **FujiNet** is fixed at v1.5.1+git-d7fd2d2fa.

The NIA `config.xml` is automatically updated if you're running on a non-Steam Deck system (replaces `/home/deck` with your actual `$HOME`).

---

## Steam Deck Controller Setup

MAME uses keyboard/joystick mapping from GTAMP's Windows distribution. You will need to set up a custom controller layout in the Steam Deck menus to map keys like **ESC**, **F3**, **F12**, and **TAB**. The MAME UI (TAB key) is active by default.

---

## Docs

Full release notes for each build are in the [docs/](docs/) folder.

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
