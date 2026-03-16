#! /usr/bin/env bash
~/linuxdeploy-static-x86_64.AppImage --appdir /home/xbox/appimage/builds/niacoco/AppDir --executable /home/xbox/nabupc/mame -d /home/xbox/nabupc/NABUPcNIA.desktop -i /home/xbox/nabupc/NABUPc.png --output appimage
cp NABUPcNIA-x86_64.AppImage builds/NABUPcTEST.AppImage
mv NABUPcNIA-x86_64.AppImage builds/
cd builds
zip NABUPcTEST.AppImage.zip NABUPcTEST.AppImage
rm NABUPcNIA-x86_64.AppImage
cd ..