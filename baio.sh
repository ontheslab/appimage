#! /usr/bin/env bash
~/linuxdeploy-static-x86_64.AppImage --appdir /home/xbox/appimage/builds/unified/AppDir --executable /home/xbox/nabupc/mame -d /home/xbox/nabupc/NABUPcAIO.desktop -i /home/xbox/nabupc/NABUPc.png --output appimage
cp NABUPcAIO-x86_64.AppImage builds/NABUPcAIO.AppImage
mv NABUPcAIO-x86_64.AppImage builds/
cd builds
zip NABUPcAIO.AppImage.zip NABUPcAIO.AppImage
rm NABUPcAIO-x86_64.AppImage
cd ..
