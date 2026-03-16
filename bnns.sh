#! /usr/bin/env bash
~/linuxdeploy-static-x86_64.AppImage --appdir /home/xbox/appimage/builds/nns/AppDir --executable /home/xbox/nabupc/mame -d /home/xbox/nabupc/NABUPcNNS.desktop -i /home/xbox/nabupc/NABUPc.png --output appimage
cp NABUPcNNS-x86_64.AppImage builds/NABUPcNNS.AppImage
mv NABUPcNNS-x86_64.AppImage builds/
cd builds
zip NABUPcNNS.AppImage.zip NABUPcNNS.AppImage
rm NABUPcNNS-x86_64.AppImage
cd ..
