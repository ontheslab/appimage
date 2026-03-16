### NABU/MAME NIA AppImage with Experimental CoCo FujiNet Support

**"Alpha test - Release" version 1.101** - "AppImage" build of **_NABU PC MAME_** with Experimental **_CoCo FujiNet_** Server Build for Steam Deck.

**FujiNet** - Internet/Network Connectivity for 8bit computers - In this case for the **"CoCo"** - The included server simulates the function of the Hardware device and allows connection via localhost - see: https://fujinet.online/

The release contains the latest Linux MAME binary - at time of this release (Including opennabu & v14p bios support).

All NABU - related - details remain the same as the previous releases - Additions relate **ONLY** to the integration of **_CoCo FujiNet_** support.

This is a Linux 64bit Build - targeted at the Steam Deck - It should run on my most other modern Linux distros - I build and test it on Linux Mint & WSL2. Sample pictures are from WSL2. 

Summary information:

- AppImage built as per previous NABUPc Builds with the additional ability to launch a **_CoCo FujiNet_** in background
- **MAME** configuration files are stored in your “user home” folder under **“~/.mamadata”**
- Screen captures are saved to the “user home” – “Pictures” folder under **“~/Pictures/coco3”**
- **CoCo FujiNet** places it's program and "data" files in **“~/Documents/FujiNetCoCo”** (Built on startup)
- **CoCo ROMS** Must be placed in **"~/.mamedata/roms/coco3"** (coco3.rom, disk10.rom & hdbdw3bc3.rom) required and **NOT** included in this AppImage.
- **MAME** NABUPc emulation is configured with stock joystick and keyboard mapping as per "GTAMP"'s Windows distribution. CoCo3 emulation for basic key mapping and "host" keyboard config. You will need to setup a custom controller mapping on the SteamDeck for commands such as "ESC", "F3", "TAB", etc to make it easy to operate. This is easy to do from the SteamDeck menus.

_The configuration folders will be re-created if deleted (default configuration). Configuration files in these locations can be manually edited if required.
The installed “Documents/FujiNetCoCo” is a fixed version "FujiNet v1.5.1+git-d7fd2d2fa" and is manually update-able (https://github.com/FujiNetWIFI/fujinet-firmware)._

Normal NABU PC function - Basic syntax and examples: "./NABUPcTEST.AppImage <options>"

./NABUPcTEST.AppImage         - Normal NABU Function - Will launch the NIA as a background task and then Launch MAME connecting to it via localhost.
./NABUPcTEST.AppImage --help  - Will display a list of available "AppImage" Commands and basic syntax.

All normal MAME command line options can also be passed to MAME.

**CoCo FujiNet basic operation and Examples**

Ensure your **CoCo ROM** Files are installed in - **"~/.mamedata/roms/coco3"** (coco3.rom, disk10.rom & hdbdw3bc3.rom) required.

./NABUPcTEST.AppImage --fuji

This example will **NOT** run any **"NABU Servers"**, it will instead launch the "CoCo FujiNet" server in the background and then launch MAME as a "coco3" pre-configured to connect to it.

These are **NOT** instructions on how to use **FujiNet** - Please refer to: https://fujinet.online/

Basic "Pictorial" Instructions with example images:

<img width="744" height="284" alt="1 FujiNetDataFiles" src="https://github.com/user-attachments/assets/1bcbd3d1-aac4-44cb-9f7a-821fb8584ec7" />

Like the other NABU Images, server related files are installed in **“~/Documents/FujiNetCoCo”**

<img width="946" height="374" alt="2 FujiNetNABUPcTESTHelp" src="https://github.com/user-attachments/assets/cddabc61-1e79-47e7-bab9-a1f4ee8878a9" />

The "./NABUPcTEST.AppImage --help" command will give you the available options

<img width="938" height="617" alt="3 FujiNetTaskLauch" src="https://github.com/user-attachments/assets/a77998ce-f599-43d9-9f21-6e8b710d143c" />

When you launch the AppImage (./NABUPcTEST.AppImage --debug --fuji) the CoCo FujiNet server is launched as a background task attached to **localhost**

<img width="1030" height="786" alt="4 FujiNetMainScreen" src="https://github.com/user-attachments/assets/e9cd2874-892c-48a3-b991-ccc1b3ec0046" />

The Main "FujiNet" screen will then load

<img width="1035" height="785" alt="5 FujiNetConfigScreen" src="https://github.com/user-attachments/assets/2f842140-e9b0-4d40-887d-7ddfffd9f7c7" />

The "FujiNet" Configuration screen

<img width="1038" height="789" alt="6 FujiNetSDCardFiles" src="https://github.com/user-attachments/assets/2aae06c1-142b-4a4a-906f-831cb90411fe" />

The "FujiNet" simulates a local SD card function - select SD from the main menu - files are located in: "~/Documents/FujiNetCoCo/SD"

<img width="1035" height="791" alt="7 FujiNetSelectingServerFiles" src="https://github.com/user-attachments/assets/1d189c26-8633-4fea-9a7d-d90999a56ee2" />

Select files (disk images) from one of he remote server listed on the main menu (go to the "coco" folder for compatible files)

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

If you load the "LOBBY" disk image - you will launch the "Online Game Lobby" here you can join one of the multi-player games and play against other 8bit users on the supported platforms!

<img width="1036" height="793" alt="15 FujiNetBattleShip" src="https://github.com/user-attachments/assets/bbe8026d-b614-4a36-a8ee-6c102f0fe1d4" />

Running "FUJI BATTLESHIP"

<img width="648" height="393" alt="16 FujiNetServerShutdown" src="https://github.com/user-attachments/assets/b7d37e5c-28b9-490c-9bd3-bfaa19eac5ca" />

When you close MAME normally, the background server is shutdown.

**Important Note:** If you have run an older version on my AppImages, you will need to "reset" your config files with the **"--reset"** command line option (once only).
This will rename your old folders to "*.OLD", you are then free to manually copy back any customisations you may have previously made.
This is required to ensure the "latest" base config files are being used.

Acknowledgements, This AppImage contains contributions from and the very hard work of: The **FujiNet** Team, GryBsh, GTAMP, brijohn, DJ, Leo & LaBomb.

Please NOTE: This is NOT well tested, it’s an experiment at present - the only thing I can guarantee is that they "will" break your system! ;-)

V1.2DOC