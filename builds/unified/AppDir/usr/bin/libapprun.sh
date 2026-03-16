# libapprun.sh — Shared functions for NABUPcAIO AppImage
# v1.00 — Initial unified library extracted from NIA/NNS/niacoco AppRun scripts
# v1.01 — launch_nns and launch_fuji open web UI when --config passed
#
# SOURCE this file from AppRun — do not execute directly.
#
# Variables expected to be set by AppRun before sourcing:
#   this_dir      — absolute path to AppDir root
#   home_dir      — $HOME
#   DEBUG         — true/false
#   readme_file   — filename of bundled .txt doc (e.g. NABUPcAIO.txt)
#   nia_data_dir  — ~/Documents/NABU Internet Adapter
#   nns_data_dir  — ~/.nns
#   fuji_data_dir — ~/Documents/FujiNetCoCo
#   data_dir      — ~/.mamedata

# ---------------------------------------------------------------------------
# Debug helper
# ---------------------------------------------------------------------------

debug_echo() {
    if $DEBUG; then
        echo "$@"
    fi
}

# ---------------------------------------------------------------------------
# Kill functions
#
# Uses ps aux (all processes, all users — catches stale sessions) with the
# bracket trick [X]xx to prevent the grep matching its own process entry.
# Unquoted $var on kill handles multiple PIDs returned cleanly.
# '|| true' prevents set -e aborting if kill races a self-exited process.
# ---------------------------------------------------------------------------

kill_nia() {
    debug_echo "Testing for running NIA processes"
    nia_id=$(ps aux | grep '[N]ABU-Internet-Adapter-84' | awk '{print $2}')
    if [ -n "$nia_id" ]; then
        debug_echo "Found running NIA: $nia_id"
        kill $nia_id 2>/dev/null || true
        debug_echo "Running NIA - Killed"
    else
        debug_echo "None found"
    fi
}

kill_nns() {
    debug_echo "Testing for running NNS processes"
    # [r]unnns matches 'sh ./runnns'; [.]/nns matches './nns'
    # Avoids matching '--server nns' in the AppImage's own command line
    nns_id=$(ps aux | grep -E '[r]unnns|[.]/nns' | awk '{print $2}')
    if [ -n "$nns_id" ]; then
        debug_echo "Found running NNS: $nns_id"
        kill $nns_id 2>/dev/null || true
        debug_echo "Running NNS - Killed"
    else
        debug_echo "None found"
    fi
}

kill_fuji() {
    debug_echo "Testing for running FujiNet processes"
    fuji_id=$(ps aux | grep '[f]ujinet' | awk '{print $2}')
    if [ -n "$fuji_id" ]; then
        debug_echo "Found running FujiNet: $fuji_id"
        kill $fuji_id 2>/dev/null || true
        debug_echo "Running FujiNet - Killed"
    else
        debug_echo "None found"
    fi
}

# ---------------------------------------------------------------------------
# Setup functions — create user data dirs and seed from AppImage on first run
# ---------------------------------------------------------------------------

setup_nia() {
    debug_echo "Home Path is: $home_dir"
    debug_echo "Setting up NABU Internet Adapter"
    debug_echo "Data Path: $nia_data_dir"

    if ! test -d "$home_dir/Documents"; then
        debug_echo "Creating new Documents directory"
        mkdir "$home_dir/Documents"
    fi

    if ! test -d "$nia_data_dir"; then
        debug_echo "Creating new NIA data directory"
        mkdir "$nia_data_dir"
    fi

    # Seed NIA files from AppImage on first install (config.xml is the sentinel)
    if ! test -f "$nia_data_dir/config.xml"; then
        debug_echo "New install: copying NIA files"
        cp "$this_dir/usr/bin/NABU Internet Adapter/"* "$nia_data_dir"
        cd "$nia_data_dir"
        ln -s /lib/x86_64-linux-gnu/libdl.so.2 libdl.so
        debug_echo "$(ls -la "$nia_data_dir")"
    fi

    # Patch config.xml home path when not running on Steam Deck
    target_file="$nia_data_dir/config.xml"
    if grep -q "/home/deck" "$target_file"; then
        if [[ "$HOME" != "/home/deck" ]]; then
            debug_echo "Updating home path in $target_file from /home/deck to $HOME"
            sed -i "s|/home/deck|$HOME|g" "$target_file"
        else
            debug_echo "Home path matches /home/deck — no changes needed"
        fi
    else
        debug_echo "No /home/deck entry found in $target_file"
    fi

    cd "$this_dir/usr/bin"
}

setup_nns() {
    debug_echo "Home Path is: $home_dir"
    debug_echo "Setting up NNS"
    debug_echo "Data Path: $nns_data_dir"
    # NNS self-initialises its own ~/.nns directory on first run
    # No seeding required
}

setup_fuji() {
    debug_echo "Home Path is: $home_dir"
    debug_echo "Setting up CoCo FujiNet"
    debug_echo "Data Path: $fuji_data_dir"

    if ! test -d "$home_dir/Documents"; then
        debug_echo "Creating new Documents directory"
        mkdir "$home_dir/Documents"
    fi

    if ! test -d "$fuji_data_dir"; then
        debug_echo "Creating new FujiNetCoCo data directory"
        mkdir "$fuji_data_dir"
    fi

    # Seed FujiNet files from AppImage on first install (fnconfig.ini is the sentinel)
    if ! test -f "$fuji_data_dir/fnconfig.ini"; then
        debug_echo "New install: copying FujiNet files"
        cp -r "$this_dir/usr/bin/FujiNetCoCo/"* "$fuji_data_dir"
        debug_echo "$(ls -la "$fuji_data_dir")"
    fi

    cd "$this_dir/usr/bin"
}

setup_mame() {
    debug_echo "Setting up MAME"
    debug_echo "Data Path: $data_dir"

    if ! test -d "$data_dir"; then
        debug_echo "Creating new MAME data directory"
        mkdir "$data_dir"
    fi

    if ! test -d "$data_dir/cfg"; then
        debug_echo "Creating new MAME config directory"
        mkdir "$data_dir/cfg"
    fi

    # Seed cfg files on first install (nabupc.cfg is the sentinel)
    if ! test -f "$data_dir/cfg/nabupc.cfg"; then
        debug_echo "Copying new MAME config files"
        cp "$this_dir/usr/bin/cfg/"*.* "$data_dir/cfg"
    fi

    if ! test -d "$data_dir/roms"; then
        debug_echo "Creating new MAME roms directory"
        mkdir "$data_dir/roms"
        debug_echo "Copying initial rom files"
        cp "$this_dir/usr/bin/roms/"* "$data_dir/roms" 2>/dev/null || true
    fi

    if ! test -d "$data_dir/disks"; then
        debug_echo "Creating new MAME disks directory"
        mkdir "$data_dir/disks"
        debug_echo "Copying initial disk files"
        cp "$this_dir/usr/bin/disks/"* "$data_dir/disks" 2>/dev/null || true
    fi

    if ! test -d "$home_dir/Pictures"; then
        debug_echo "Creating new Pictures directory"
        mkdir "$home_dir/Pictures"
    fi

    if ! test -d "$home_dir/Pictures/nabupc"; then
        debug_echo "Creating new nabupc snapshot directory"
        mkdir "$home_dir/Pictures/nabupc"
    fi

    # Migrate screenshots from old snap/ location
    if test -d "$data_dir/snap/nabupc"; then
        debug_echo "Migrating old snapshots to Pictures"
        cp "$data_dir/snap/nabupc/"*.* "$home_dir/Pictures/nabupc"
        debug_echo "Removing old snapshots folder"
        rm -rf "$data_dir/snap/nabupc"
    fi
}

# ---------------------------------------------------------------------------
# Launch functions — each server runs as a background process
# ---------------------------------------------------------------------------

launch_nia() {
    debug_echo "Launching NABU Internet Adapter server"
    sh ./runserver "$@" &
    sleep 10
}

launch_nns() {
    debug_echo "Launching NNS"
    sh ./runnns "$@" &
    sleep 10
    if printf '%s\n' "$@" | grep -q '^--config$'; then
        debug_echo "Opening NNS web UI"
        xdg-open http://localhost:5000
    fi
}

launch_fuji() {
    debug_echo "Launching FujiNetCoCo server"
    sh ./runfuji "$@" &
    sleep 10
    if printf '%s\n' "$@" | grep -q '^--config$'; then
        debug_echo "Opening FujiNet web UI"
        xdg-open http://localhost:8000
    fi
}

# ---------------------------------------------------------------------------
# MAME runner
# ---------------------------------------------------------------------------

run_mame() {
    debug_echo "Running MAME with arguments: $@"
    ./runmame "$@"
}

# ---------------------------------------------------------------------------
# Reset — backs up all data dirs and regenerates defaults
# ---------------------------------------------------------------------------

reset_configs() {
    echo -e "Resetting all configs to defaults"

    if test -d "$nia_data_dir"; then
        echo -e "Backing up $nia_data_dir to $nia_data_dir.old"
        mv "$nia_data_dir" "$nia_data_dir.old"
    fi

    if test -d "$nns_data_dir"; then
        echo -e "Backing up $nns_data_dir to $nns_data_dir.old"
        mv "$nns_data_dir" "$nns_data_dir.old"
    fi

    if test -d "$fuji_data_dir"; then
        echo -e "Backing up $fuji_data_dir to $fuji_data_dir.old"
        mv "$fuji_data_dir" "$fuji_data_dir.old"
    fi

    if test -d "$data_dir"; then
        echo -e "Backing up $data_dir to $data_dir.old"
        mv "$data_dir" "$data_dir.old"
    fi

    setup_nia
    setup_nns
    setup_fuji
    setup_mame

    echo -e "All configs reset. Old configs backed up to .old directories.\n"
    exit 0
}

# ---------------------------------------------------------------------------
# Display readme (readme_file set by AppRun)
# ---------------------------------------------------------------------------

display_readme() {
    more "$this_dir/usr/bin/$readme_file"
    exit 0
}
