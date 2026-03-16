#! /usr/bin/env bash
~/linuxdeploy-static-x86_64.AppImage --appdir /home/xbox/appimage/builds/nia/AppDir --executable /home/xbox/nabupc/mame -d /home/xbox/nabupc/NABUPcNIA.desktop -i /home/xbox/nabupc/NABUPc.png --output appimage
cp NABUPcNIA-x86_64.AppImage builds/NABUPcNIA.AppImage
mv NABUPcNIA-x86_64.AppImage builds/
cd builds
zip NABUPcNIA.AppImage.zip NABUPcNIA.AppImage
rm NABUPcNIA-x86_64.AppImage
cd ..
