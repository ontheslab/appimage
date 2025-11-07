# New AppImage Builds

## NABU PC MAME AppImage Builds that include NABU NetSim (NNS) or NABU Internet Adapter (NIA) for Steam Deck

These programs are an **"AppImage"** = self-contained 64bit Linux x86 executable container - all required libraries included (should be). The goal was to make **NABU PC MAME (r0.250)** easier to run on the Linux platform - in particular the **"Steam Deck"**.

### Notes - Draft Instructions:

Both *current* an *alpha* release AppImages contain the latest Linux NABU PC MAME binary (Including opennabu & v14p bios support).

They contain either **NABU NetSim (NNS) by Nick Daniels (GryBsh)** or **NABU Internet Adapter (NIA) by DJ Sures** that can be run as a background process.
All Thanks to DJ & Nick for their permission to include them in these AppImages.

So, by default it’s an **"all-in-one"** headless solution for portable NABU play from your (chosen) NABU Network simulator running as a background task - no need for external connection to a server.

These are Linux 64bit Builds - targeted at the **"Steam Deck"** - They should run on my most other modern Linux distros - I build and test it on **Linux Mint & WSL2**. It has also been tested under WSL2 Debian - thanks to _**Productiondave**_.

** **Important Note** - for any use other than the default **"standalone"** option, some knowledge of MAME command line and configuration options may be required.

**Summary information (including important file locations):**

- MAME configuration & other files are stored in your "user home" folder under **"~/.mamadata"**
- Screen captures are saved to the "user home" – "Pictures" folder under **"~/Pictures/nabupc"**
- NABU NetSim places it's "data" files in **"~/.nns"** (Built on startup)
- NABU Internet Adapter and its files are installed in your “user home” – “Documents” folder under **“~/Documents/NABU Internet Adapter”**
- MAME is configured with stock joystick and keyboard mapping as per "GTAMP"'s Windows distribution. You will need to setup a custom controller mapping on the SteamDeck for commands such as **"ESC", "F3", "F12", "TAB"**, etc to make it easy to operate. This is easy to do from the Steam Deck menus, MAME's UI interface is now set to active by default (accessed with the **"TAB"** key).

The configuration folders will be re-created if deleted (default configuration). Configuration files in these locations can be manually edited if required.

Currently the installed "NABU NetSim" is a fixed version and is not update-able at this time. It is the latest "SD-5" WIP release.

The installed “NABU Internet Adapter” can be upgrade by dropping a new version binary in the **“~/Documents/NABU Internet Adapter”** folder (https://cloud.nabu.ca/linux-x64.zip).

In the following examples **"NABUPcNxx.AppImage"** refers to _**"both"**_ - **NABUPcNNS.AppImage & NABUPcNIA.AppImage**

Basic syntax and examples: **"./NABUPcNxx.AppImage <options>"**

- **./NABUPcNxx.AppImage**
  - Will launch the chosen server as a background task and then Launch MAME in 80col mode and connecting to it via localhost.
- **./NABUPcNxx.AppImage --help**
  - Will display a list of available "AppImage" Commands and basic syntax then exit.

**Current (Combined) HELP Output:**

>Options:
>
>        --help   - Display this screen and version number then exit.
>        --nonia  - Do not run NIA (also clears any running NIA tasks) (DJSures)
>        --nonns  - Do not run NNS (also clears any running NNS tasks) (GryBsh)
>        --coleco - Run internal Coleco ROMs (Menu Version) in NABU coleco.npz (brijohn)
>        --reset  - Reset NIA or NNS and MAME configs to defaults and exit (Backup current folders to .old)
>        --debug  - Enable debug output (Displays all script output)
>        --about  - Display the inbuilt readme file

_**Note: --nonia (works in NIA Version only) & --nonns (works in NNS Version only)**_ 

When **"NO"** command line options are given, the AppImage will start the bundled server as background task and then launch MAME using the following pre-configured command line:

**"nabupc -resolution 1024x768 -nabu_video tms9938 -hcca null_modem -bitb socket.127.0.0.1:5816"**

The **"Options"** listed in the **HELP** output above prefixed with **"--"** are filtered out and not passed to MAME.

__**__ **You can see all of the commands issued to MAME by using the --debug option**

**Special Note:** so if you run the AppImage with **--nonns** or **--nonia** and supply no other commands the default command line will be passed to MAME and it will most likely fail as it will have no server to connect to. However if another server is running locally (on localhost) it will connect to that.

This is my _"clumsy"_ attempt to make it as versatile as possible. Just want to run it "hands free" with o external connections and in the default 80col mode - just run it with NO options.

### Explanation:

**--nonns** or **--nonia** disable the internal server and **MAME** runs as normal with the default behaviour of connecting to a _**localhost**_ server.

To run MAME with your own combination of options, simply supply a **"FULL"** command line to be passed to MAME.
All normal MAME command line options can also be passed to MAME in this way.

Basic MAME Only syntax: **"./NABUPcNxx.AppImage --noxxx \<full MAME command line\>"** 
* Replace **--noxxx** with **--nonns** or **--nonia** 

**Some Examples (just adjust for NABUPcNNS.AppImage or NABUPcNIA.AppImage):**

**./NABUPcNNS.AppImage --nonns nabupc -window -resolution 1024x768 -nabuvideo tms9938 -hcca nullmodem -bitb socket.192.168.0.211:5816**

This example will NOT run "NNS" (--nonns), will launch MAME as a "nabupc" normally with all the included options, in this case 80col, 1024x768 window and connect to my local server at "192.168.0.211".

**./NABUPcNIA.AppImage --debug nabupc -window -resolution 1024x768 -bios ver14p -hcca nullmodem -bitb socket.127.0.0.1:5816**

This example will run "NIA", will launch MAME as a "nabupc" with all the included options, in this case 40col, 1024x768 window, using the patched Ver14 BIOS, connect to the internal NIA server and display a full summary of what it's doing (--debug). (In other words just overriding the default internal settings).

**./NABUPcNNS.AppImage --nonns --coleco**

or

**./NABUPcNIA.AppImage --nonia --coleco**

These examples will run MAME with no server or debug output and launch the local (inbuilt) copy of brijohn's "coleco.npz" (Coleco rom conversions collection with menu). It uses the following internal command: **"nabupc -window -resolution 1024x768 -hcca hcca_local -npz nabu/coleco.npz"**

**./NABUPcNNS.AppImage --nonns --debug nabupc -window -resolution 1024x768 -hcca hcca_local -npz ~/Documents/nabu/Digger.npz**

This command will run MAME (in a 1024x768 window) with no NNS, it will show debug information and will load the file "Digger.npz" stored in the local folder "~/Documents/nabu". Any locally stored files (npz, floppy images, etc) can be loaded in this way using the appropriate MAME command line options.

_**Any additional MAME commands for Joystick config etc of course can simply be appended to these commands.**_

__**__ **Special Notes relating to the inbuilt servers**

**NNS** - The NNS version included is a fixed version and is not easily update-able at present (but its on my road map.

**NIA** - The included NIA version is update-able but has a "fixed/pre-configured" config.xml that will have to be edited manually if it requires any customisation. The GUI configuration mode is not available at present (but its on my road map).

The **NIA** config file **(config.xml)** is located here: **"~/Documents/NABU Internet Adapter/config.xml"**


__**__ **AppImage Upgrade Information**

If you have run any of my older AppImages I would suggest - resetting the config files first (old files are saved).

**"./NABUPcNxx.AppImage --reset"** - will backup your old config folders (.old) and the AppImage will build new folders with updated config files.


**Some Useful MAME config example commands (semi-advanced):**

**-rompath ~/.mamedata/roms** (Tells MAME to use **"~/.mamedata/roms"** for rom files)

**-ui_active** (Force MAME to start with UI active - this is now default in the ini files)

**-inipath ~/.mamedata/ini** (Tells MAME to use **"~/.mamedata/ini"** for ini files)

__**__ **Note:** MAME may not run correctly if **"ini"** files do not exist in an alternative **"ini"** path.

---------------------------------------------------------------------------------------------------

### Secondary functions section (SepTandy Easter Eggs)

While building the new Linux binaries from the latest NABU source update I decided to add a couple of additional "cores" to the binary, in the hope of getting them going on the Steam Deck.

The MAME Linux binary in these two AppImages now has these additional cores: _**CoCo3 & Vectrex**_

__**__ **rom files for these cores are _NOT_ included**

__**__ The AppImages contain pre-configured "cfg" & "ini" files for all 3 additional cores - alpha build is the most up-to-date.

__**__ The Color Computer 3 core supports both 6809 (coco3) and 6309 (coco3h) CPU's

I would suggest the following location for your additional files:

**ROM files - "~/.mamedata/roms"** - To keep all roms together - I would suggest "named" sub-folders containing the roms.

- **eg;** **"~/.mamedata/roms/coco3"**, **"~/.mamedata/roms/coco3h"**, **"~/.mamedata/roms/vectrex"**

**DATA files - "~/Documents/coco"** etc - example; I already have "~/Documents/nabu" for my additional NABU files.

You can place CoCo floppy, Cartridge and VHD files in here (system rom files required for commands below to work).

In the following examples **"NABUPcNxx.AppImage"** refers to _**"both"**_ - **NABUPcNNS.AppImage & NABUPcNIA.AppImage**

**Operational examples (base machine only with debug):**

__**__ Replace "xx" with "ns" or "ia" etc

**Vectrex** - ./NABUPcNxx.AppImage --nonxx --debug vectrex  -window -rompath ~/.mamedata/roms

**Color Computer 3 (512k)**

**6809** - ./NABUPcNxx.AppImage --nonxx --debug coco3 -rompath ~/.mamedata/roms -ramsize 512k

**6309** - ./NABUPcNxx.AppImage --nonxx --debug coco3h -rompath ~/.mamedata/roms -ramsize 512k


**Operational examples (external roms, floppies, carts & VHD's etc with debug):**

__**__ These examples use NNS or NIA for clarity but are interchangeable as above.

**Vectrex:**

**./NABUPcNNS.AppImage --nonns --debug vectrex  -window -rompath ~/.mamedata/roms -cart ~/Documents/vectrex/FROGGER.BIN**

This command will run the Vectrex (vectrex) and load the "cart" Frogger.

**CoCo3:**

**./NABUPcNIA.AppImage --nonia --debug coco3h -rompath ~/.mamedata/roms -ramsize 512k -flop1 ~/Documents/coco/GUNSTAR.DSK**

This command will run a 512K CoCo3 with 6309 CPU (coco3h) and load the disk image for the fabulous GunStar game. At the command prompt, type RUN"GUNSTAR <Enter> to run the game.

**./NABUPcNNS.AppImage --nonns --debug coco3 -rompath ~/.mamedata/roms -ramsize 512k -flop1 ~/Documents/coco/PINBALL.DSK**

This command will run a 512K CoCo3 with 6809 CPU (coco3) and load the disk image for the fabulous new Pinball game. At the command prompt, type RUN"PINBALL <Enter> to run the game.

**CoCo3 Cartridge (Program-Pak):**

**./NABUPcNNS.AppImage --nonns --debug coco3 -rompath ~/.mamedata/roms -ramsize 128k -cart ~/Documents/coco/megabug.ccc**

This command will run a 128K CoCo3 6809 CPU (stock) and load the Cartridge "MegaBug" (megabug.ccc).
__**__ **Note:** Not all Cartridges work on the CoCo3


**Advanced CoCo3:**

**./NABUPcNIA.AppImage --nonia --debug coco3 -rompath ~/.mamedata/roms -ramsize 512k -ext multi -ext:multi:slot4 fdc -cart5 ~/.mamedata/roms/coco3/RGBDOS2HD.ROM -hard1 ~/Documents/coco/CoCoSDC.VHD**

This command is more complex, it runs a CoCo3 with the following options:
- 512K CoCo 3 6809 CPU
- Multi-Pak installed with Floppy Controller in slot 4
- RGBDOS Rom (bootable) in Cartridge slot 5
- CoCoSDC.VHD (Bootable) Hard drive image as HDD #1 (hard1)
- __**__ example only! I'm no expert!

The **"alpha"** builds contain the most up-to-date config files: https://github.com/ontheslab/appimage/releases/tag/v1.0.1alpha

---------------------------------------------------------------------------------------------------

**Acknowledgements**, These AppImages contain contributions from and the very hard work of: DJ, GryBsh, GTAMP, brijohn & LaBomb. Special thanks to Leo and DJ without whom we would not be here.

**Additional** CoCo thanks, henryr. for his wonderful HDD image & Nick M for his fabulous CoCo Games! 

**Reference Links:**
- https://gtamp.com/nabu/
- https://nabu.ca/cloud-cpm
- https://github.com/GryBsh/NabuNetSim
- https://github.com/brijohn/nabupc
- https://github.com/labomb/NABU_PC_Stuff
- https://github.com/linuxplayground/nabu-games

Please NOTE: This is NOT well tested, it’s an experiment at present - the only thing I can guarantee is that they "will" break your system! :wink:

_Doc Version 1.00_
