### NABU PC MAME All-In-One AppImage for Steam Deck & Linux

**Release version 1.10** - "AppImage" build of **_NABU PC MAME_** — All-In-One edition combining **_NIA_**, **_NNS_** and **_CoCo FujiNet_** server support in a single AppImage for Steam Deck & Linux.

This release supersedes all previous individual AppImage builds (**NABUPcNIA**, **NABUPcNNS** and **NABUPcTEST**). Everything they did is now in one place, with a cleaner command line interface and a number of fixes and improvements.

The release contains the latest Linux MAME binary at time of this release (including opennabu & v14p bios support).

This is a Linux 64bit Build - targeted at the Steam Deck - It should run on most modern Linux distros - Built and tested on Linux Mint and WSL2.

---

**Bundled Servers:**

- **NIA** - NABU Internet Adapter (c) DJ Sures — connects to nabu.ca retronet, runs headless in the background. All thanks to DJ for his permission to include it.
- **NNS** - NABU NetSim v1.3.4-release5 by Nick Daniels (GryBsh) — advanced local NABU simulator with web UI. All thanks to Nick for his permission to include it.
- **FujiNet** - CoCo FujiNet v1.5.1 (FujiNet Team) — Internet/Network connectivity for the CoCo3 8-bit computer via MAME. See: https://fujinet.online/

---

**Summary information:**

- **MAME** configuration files are stored in your "user home" folder under **"~/.mamedata"**
- Screen captures are saved to the "user home" – "Pictures" folder under **"~/Pictures/nabupc"**
- **NIA** and its files are installed in your "user home" – "Documents" folder under **"~/Documents/NABU Internet Adapter"**
- **NNS** places its data files in **"~/.nns"** (built on first run)
- **CoCo FujiNet** places its program and data files in **"~/Documents/FujiNetCoCo"** (built on first run)
- **MAME** is configured with stock joystick and keyboard mapping as per "GTAMP"'s Windows distribution. You will need to setup a custom controller mapping on the SteamDeck for commands such as "ESC", "F3", "TAB", etc. This is easy to do from the SteamDeck menus.

_All configuration folders will be re-created if deleted (default configuration). Configuration files in these locations can be manually edited if required._

_The installed **NIA** can be upgraded by dropping a new version binary into "~/Documents/NABU Internet Adapter". NNS is a fixed bundled version. FujiNet can be updated by replacing the contents of "~/Documents/FujiNetCoCo"._

---

**Basic syntax:** `./NABUPcAIO.AppImage <options> <mame options>`

```
./NABUPcAIO.AppImage             Default — MAME connects directly to nabu.ca via hcca_remote (no server)
./NABUPcAIO.AppImage --help      Display available options and exit
./NABUPcAIO.AppImage --about     Display the bundled readme
```

**Server selection — use --server to choose which bundled server to run:**

```
./NABUPcAIO.AppImage --server nia    Launch NIA + MAME — nabu.ca session via bundled NIA
./NABUPcAIO.AppImage --server nns    Launch NNS + MAME — local simulator session
./NABUPcAIO.AppImage --server fuji   Launch CoCo FujiNet + MAME as CoCo3
./NABUPcAIO.AppImage --server none   No server — MAME only (same as default)
```

**Configuration UI — use --config with --server to configure a server without launching MAME:**

```
./NABUPcAIO.AppImage --server nia --config    Open NIA config GUI — exits cleanly when you close the window
./NABUPcAIO.AppImage --server nns --config    Start NNS and print web UI URL (http://localhost:5000) — press Enter to stop
./NABUPcAIO.AppImage --server fuji --config   Start FujiNet and print web UI URL (http://localhost:8000) — press Enter to stop
```

**Other options:**

```
./NABUPcAIO.AppImage --coleco          Run the built-in Coleco ROM collection (brijohn) — no server needed
./NABUPcAIO.AppImage --mame <cmd>      MAME only — pass a fully custom MAME command directly (exclusive)
./NABUPcAIO.AppImage --reset           Reset all configs to defaults — backs up existing data to .old
./NABUPcAIO.AppImage --debug           Enable debug output
```

All standard MAME command line options can be appended and are passed directly to MAME.

---

**Bonus Cores — Vectrex and CoCo3**

The bundled MAME binary also includes **Vectrex** and **CoCo3 / CoCo3h** emulation. Place your own ROM files in `~/.mamedata/roms/<system>/` before use. Use `--mame` to run these cores.

```
./NABUPcAIO.AppImage --mame vectrex -window -rompath ~/.mamedata/roms
./NABUPcAIO.AppImage --mame coco3 -window -rompath ~/.mamedata/roms
./NABUPcAIO.AppImage --mame coco3h -window -rompath ~/.mamedata/roms -ramsize 512k -flop1 ~/Documents/coco/MYGAME.DSK
```

- `coco3` — Motorola 6809 CPU (original hardware)
- `coco3h` — Hitachi HD6309 CPU (faster; use for HD6309 software)

---

**CoCo FujiNet basic operation and Examples**

`./NABUPcAIO.AppImage --server fuji`

This will launch the **CoCo FujiNet** server in the background and then launch MAME as a **"coco3"** pre-configured to connect to it.

These are **NOT** instructions on how to use FujiNet - Please refer to: https://fujinet.online/

Basic "Pictorial" Instructions with example images:

<img width="744" height="284" alt="1 FujiNetDataFiles" src="https://github.com/user-attachments/assets/1bcbd3d1-aac4-44cb-9f7a-821fb8584ec7" />

Like the other NABU Images, server related files are installed in **"~/Documents/FujiNetCoCo"**

<img width="946" height="374" alt="2 FujiNetNABUPcTESTHelp" src="https://github.com/user-attachments/assets/cddabc61-1e79-47e7-bab9-a1f4ee8878a9" />

The `./NABUPcAIO.AppImage --help` command will give you the available options

<img width="938" height="617" alt="3 FujiNetTaskLauch" src="https://github.com/user-attachments/assets/a77998ce-f599-43d9-9f21-6e8b710d143c" />

When you launch the AppImage (`./NABUPcAIO.AppImage --debug --server fuji`) the CoCo FujiNet server is launched as a background task attached to **localhost**

<img width="1030" height="786" alt="4 FujiNetMainScreen" src="https://github.com/user-attachments/assets/e9cd2874-892c-48a3-b991-ccc1b3ec0046" />

The Main "FujiNet" screen will then load

<img width="1035" height="785" alt="5 FujiNetConfigScreen" src="https://github.com/user-attachments/assets/2f842140-e9b0-4d40-887d-7ddfffd9f7c7" />

The "FujiNet" Configuration screen

<img width="1038" height="789" alt="6 FujiNetSDCardFiles" src="https://github.com/user-attachments/assets/2aae06c1-142b-4a4a-906f-831cb90411fe" />

The "FujiNet" simulates a local SD card function - select SD from the main menu - files are located in: "~/Documents/FujiNetCoCo/SD"

<img width="1035" height="791" alt="7 FujiNetSelectingServerFiles" src="https://github.com/user-attachments/assets/1d189c26-8633-4fea-9a7d-d90999a56ee2" />

Select files (disk images) from one of the remote servers listed on the main menu (go to the "coco" folder for compatible files)

<img width="1040" height="786" alt="8 FujiNetSelectedFilesLoading" src="https://github.com/user-attachments/assets/2c972a96-233b-431d-82a9-a460a5a26935" />

Once disk images have been selected and loaded into the virtual disk slots, "ESC" out (hit "ESC" twice with the default key mapping) and they will be loaded into DRIVE 0,1,2,3

<img width="1032" height="787" alt="9 FujiNetDrive0Loaded" src="https://github.com/user-attachments/assets/360b8244-8f64-4638-beae-bc14c720b44e" />

You will find that "DRIVE=0" will be loaded by default and normal HDB-DOS commands are available

<img width="1037" height="784" alt="10 FujiNetRunFilesonDisk" src="https://github.com/user-attachments/assets/352634c6-c7ee-4aba-9cf4-0eaca71b05b5" />

Run / load any programs on the disks as normal! (RUNM"NEWS" for example)

<img width="1037" height="786" alt="12 FujiNetNewsScreenSizeAdjust" src="https://github.com/user-attachments/assets/915cad1d-85b8-46f7-bdf2-49d4654a14ca" />

<img width="1039" height="787" alt="13 FujiNetRedingtheNews" src="https://github.com/user-attachments/assets/aff32175-1343-4cfb-92b1-124073d01c96" />

Use "W" to adjust the screen to something more readable

<img width="1034" height="788" alt="14 FujiNetGamesLobbyLoaded" src="https://github.com/user-attachments/assets/daba7ecf-4392-45e9-9f30-b88a92920473" />

If you load the "LOBBY" disk image - you will launch the "Online Game Lobby" where you can join one of the multi-player games and play against other 8bit users on the supported platforms!

<img width="1036" height="793" alt="15 FujiNetBattleShip" src="https://github.com/user-attachments/assets/bbe8026d-b614-4a36-a8ee-6c102f0fe1d4" />

Running "FUJI BATTLESHIP"

<img width="648" height="393" alt="16 FujiNetServerShutdown" src="https://github.com/user-attachments/assets/b7d37e5c-28b9-490c-9bd3-bfaa19eac5ca" />

When you close MAME normally, the background server is shutdown.

---

**Important Note — Upgrading from an older AppImage:**

If you have run any previous version of my AppImages (NABUPcNIA, NABUPcNNS or NABUPcTEST), run the **"--reset"** option once after first launch.

`./NABUPcAIO.AppImage --reset`

This will rename your old config folders to "*.old" — you are then free to manually copy back any customisations you may have previously made. This ensures the latest base config files are in use.

---

This is an "AppImage" = self-contained 64bit Linux x86 executable container - all required libraries included.

Acknowledgements: This AppImage contains contributions from and the very hard work of: DJ Sures (NIA), Nick Daniels / GryBsh (NNS), the **FujiNet** Team, GTAMP, brijohn, LaBomb & Leo. Special thanks to Leo and DJ without whom none of this would exist.

Please NOTE: This is an experimental build - the only thing I can guarantee is that it _might_ break your system! ;-)

(NABUPcAIO v1.10)
