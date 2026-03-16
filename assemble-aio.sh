#! /usr/bin/env bash
# assemble-aio.sh — Populate builds/unified/AppDir/usr/bin with binaries and assets
# Safe to re-run: removes and re-copies each item so the result is always fresh.
# Run from /home/xbox/appimage/

set -e

UNIFIED="builds/unified/AppDir/usr/bin"
NIA="builds/nia/AppDir/usr/bin"
NNS="builds/nns/AppDir/usr/bin"
TEST="builds/niacoco/AppDir/usr/bin"
MAME_SRC="/home/xbox/nabupc"

copy_item() {
    local label="$1" src="$2" dst="$3"
    echo "  $label"
    rm -rf "$dst"
    cp -r "$src" "$dst"
}

echo "Assembling NABUPcAIO unified AppDir..."
echo ""

# ---------------------------------------------------------------------------
# MAME binary — canonical source is the nabupc build tree
# ---------------------------------------------------------------------------
echo "MAME binary:"
copy_item "mame" "$MAME_SRC/mame" "$UNIFIED/mame"
chmod +x "$UNIFIED/mame"

# ---------------------------------------------------------------------------
# MAME shared assets — bgfx and plugins identical across all builds; take NIA
# nabu/ ROM tree same across all; roms/ and disks/ seeded from NIA
# ---------------------------------------------------------------------------
echo ""
echo "MAME shared assets:"
copy_item "bgfx/"    "$NIA/bgfx"    "$UNIFIED/bgfx"
copy_item "plugins/" "$NIA/plugins" "$UNIFIED/plugins"
copy_item "nabu/"    "$NIA/nabu"    "$UNIFIED/nabu"
copy_item "roms/"    "$NIA/roms"    "$UNIFIED/roms"
copy_item "disks/"   "$NIA/disks"   "$UNIFIED/disks"

# ---------------------------------------------------------------------------
# MAME config files — use TEST (superset: includes coco3_base.cfg etc.)
# ---------------------------------------------------------------------------
echo ""
echo "MAME config files:"
copy_item "cfg/" "$TEST/cfg" "$UNIFIED/cfg"
copy_item "ini/" "$TEST/ini" "$UNIFIED/ini"

# ---------------------------------------------------------------------------
# NIA server — binary + data files live in 'NABU Internet Adapter/'
# ---------------------------------------------------------------------------
echo ""
echo "NIA server:"
copy_item "NABU Internet Adapter/" "$NIA/NABU Internet Adapter" "$UNIFIED/NABU Internet Adapter"

# ---------------------------------------------------------------------------
# NNS server — binary, .NET runtime lib, config, content and web UI
# ---------------------------------------------------------------------------
echo ""
echo "NNS server:"
copy_item "nns"                          "$NNS/nns"                          "$UNIFIED/nns"
copy_item "appsettings.json"             "$NNS/appsettings.json"             "$UNIFIED/appsettings.json"
copy_item "libSystem.IO.Ports.Native.so" "$NNS/libSystem.IO.Ports.Native.so" "$UNIFIED/libSystem.IO.Ports.Native.so"
copy_item "keymaps/"                     "$NNS/keymaps"                      "$UNIFIED/keymaps"
copy_item "Files/"                       "$NNS/Files"                        "$UNIFIED/Files"
copy_item "NABUs/"                       "$NNS/NABUs"                        "$UNIFIED/NABUs"
copy_item "Packages/"                    "$NNS/Packages"                     "$UNIFIED/Packages"
copy_item "wwwroot/"                     "$NNS/wwwroot"                      "$UNIFIED/wwwroot"
chmod +x "$UNIFIED/nns"

# ---------------------------------------------------------------------------
# FujiNet server — entire FujiNetCoCo/ directory
# ---------------------------------------------------------------------------
echo ""
echo "FujiNet server:"
copy_item "FujiNetCoCo/" "$TEST/FujiNetCoCo" "$UNIFIED/FujiNetCoCo"

echo ""
echo "AppDir root:"
# linuxdeploy requires the icon at AppDir root to be a SYMLINK into the hicolor tree.
# A plain file causes linuxdeploy to fail icon lookup (tested). The symlink must exist
# before the first build so linuxdeploy can resolve it during root deployment.
mkdir -p "builds/unified/AppDir/usr/share/icons/hicolor/256x256/apps"
cp "$MAME_SRC/NABUPc.png" "builds/unified/AppDir/usr/share/icons/hicolor/256x256/apps/NABUPc.png"
ln -sf "usr/share/icons/hicolor/256x256/apps/NABUPc.png" "builds/unified/AppDir/NABUPc.png"
ln -sf "NABUPc.png" "builds/unified/AppDir/.DirIcon"
echo "  NABUPc.png (hicolor + AppDir root symlink + .DirIcon)"

echo ""
echo "Bundled readme:"
copy_item "NABUPcAIO.txt" "docs/NABUPcAIO.txt" "$UNIFIED/NABUPcAIO.txt"

echo ""
echo "Assembly complete. Run baio.sh to build NABUPcAIO.AppImage."
