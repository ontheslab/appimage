NABU PC MAME & NABU Internet Adapter AppImage Build for Steam Deck

First "Beta test - Release" version 1.00h - "AppImage" build of NABU PC MAME with Integrated NABU Internet Adapter (NIA) AppImage Build for Steam Deck.

The release contains the latest Linux MAME binary - at time of this release (Including opennabu & v14p bios support).

It also contains the NABU Internet Adapter (NIA) (c) DJ Sures running as a background process. All Thanks to DJ for his permission to include it in the AppImage.

So, by default it’s an "all-in-one" headless solution for portable NABU play from the nabu.ca retronet network.

This is a Linux 64bit Build - targeted at the Steam Deck - It should run on my most other modern Linux distros - I build and test it on Linux Mint & WSL2.

As with the "alpha release", No detailed documentation has been created at this time. If you know how to add an AppImage to your Steam Deck then please give it a try.

Summary information:

- MAME configuration files are stored in your “user home” folder under “~/.mamadata”
- Screen captures are saved to the “user home” – “Pictures” folder under “~/Pictures/nabupc”
- NABU Internet Adapter and its files are installed in your “user home” – “Documents” folder under “~/Documents/NABU Internet Adapter”
- MAME is configured with stock joystick and keyboard mapping as per "GTAMP"'s Windows distribution. You will need to setup a custom controller mapping on the SteamDeck for commands such as "ESC", "F3", "TAB", etc to make it easy to operate. This is easy to do from the SteamDeck menus

The configuration folders will be re-created if deleted (default configuration). Configuration files in these locations can be manually edited if required.
The installed “NABU Internet Adapter” can be upgrade by dropping the new version binary in the “~/Documents/NABU Internet Adapter” folder.

Basic syntax and examples: "./NABUPcNIA.AppImage <options>"

./NABUPcNIA.AppImage         - Will launch the NIA as a background task and then Launch MAME connecting to it via localhost.
./NABUPcNIA.AppImage --help  - Will display a list of available "AppImage" Commands and basic syntax.
./NABUPcNIA.AppImage --about - Will display - this file (short form).

All normal MAME command line options can also be passed to MAME.

./NABUPcNIA.AppImage --nonia nabupc -window -resolution 1024x768 -nabu_video tms9938 -hcca null_modem -bitb socket.192.168.0.211:5816

This example will not run "NIA" (--nonia), will launch MAME as a "nabupc" normally with all the included options, in this case 80col, 1024x768 window and connect to my local server.

This is an "AppImage" = self-contained 64bit Linux x86 executable container - all required libraries included.

Acknowledgements, This AppImage contains contributions from and the very hard work of: DJ Sures, GTAMP, brijohn & LaBomb.
(V1.00h)
