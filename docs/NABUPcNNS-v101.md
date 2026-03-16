NABU PC MAME & NABU NetSim (NNS) AppImage Build for Steam Deck

"Beta test - Release" version 1.01 - "AppImage" build of NABU PC MAME with Integrated NABU NetSim (NNS) AppImage Build for Steam Deck.

The release contains the latest Linux MAME binary - at time of this release (Including opennabu & v14p bios support).

It contains NABU NetSim (NNS) by Nick Daniels (GryBsh) running as a background process. In fact this appimage is based on his original appimage released to the "discord" community. All Thanks to Nick for his permission to include it in this AppImage.

So, by default it’s an "all-in-one" headless solution for portable NABU play from the Advanced NABU Adaptor Server (NetSim).

This is a Linux 64bit Build - targeted at the Steam Deck - It should run on my most other modern Linux distros - I build and test it on Linux Mint & WSL2. It has also been tested under WSL2 Debian - thanks to Productiondave. 

As with the "NABUPcNIA" version, No detailed documentation has been created at this time. If you know how to add an AppImage to your Steam Deck then please give it a try.

Summary information:

- MAME configuration files are stored in your "user home" folder under "~/.mamadata"
- Screen captures are saved to the "user home" – "Pictures" folder under "~/Pictures/nabupc"
- NABU NetSim places it's "data" files in "~/.nns" (Built on startup)
- MAME is configured with stock joystick and keyboard mapping as per "GTAMP"'s Windows distribution. You will need to setup a custom controller mapping on the SteamDeck for commands such as "ESC", "F3", "TAB", etc to make it easy to operate. This is easy to do from the SteamDeck menus.

The configuration folders will be re-created if deleted (default configuration). Configuration files in these locations can be manually edited if required.
The installed "NABU NetSim" is a fixed version and is not update-able at this time. It is the latest "SD-5" WIP release.

Basic syntax and examples: "./NABUPcNNS.AppImage <options>"

./NABUPcNNS.AppImage         - Will launch the NNS as a background task and then Launch MAME connecting to it via localhost.
./NABUPcNNS.AppImage --help  - Will display a list of available "AppImage" Commands and basic syntax.

All normal MAME command line options can also be passed to MAME.

Additional Examples

./NABUPcNNS.AppImage --nonns nabupc -window -resolution 1024x768 -nabuvideo tms9938 -hcca nullmodem -bitb socket.192.168.0.211:5816

This example will NOT run "NNS" (--nonns), will launch MAME as a "nabupc" normally with all the included options, in this case 80col, 1024x768 window and connect to my local server.

./NABUPcNNS.AppImage --debug nabupc -window -resolution 1024x768 -bios ver14p -hcca nullmodem -bitb socket.127.0.0.1:5816

This example will run "NNS", will launch MAME as a "nabupc" with all the included options, in this case 40col, 1024x768 window, using the patched Ver14 BIOS, connect to the internal NNS server and display a full summary of what it's doing (--debug). (In other words just overriding the default internal settings).

This is an "AppImage" = self-contained 64bit Linux x86 executable container - all required libraries included.

Acknowledgements, This AppImage contains contributions from and the very hard work of: GryBsh, GTAMP, brijohn & LaBomb. Special thanks to Leo and DJ without whom we would not be here.

Current: This is an an amalgam build of NABUPcNIA.AppImage (me) and nns.appimage (GryBsh).

Next: I plan to make this the single all in one AppImage and not continue with the old MAME Only version (NABUPc.Appimage)

This Release contains a SepTandy Easter Egg

Please NOTE: This is NOT well tested, it’s an experiment at present - the only thing I can guarantee is that they "will" break your system! ;-)
