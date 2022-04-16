#!/usr/bin/env bash

# Generates .desktop entries for all installed Steam games with box art for
# the icons to be used with a specifically configured Rofi launcher

APP_PATH=$CACHE_DIR/applications

# Fetch all Steam library folders.
steam-libraries() {
    echo "$STEAM_DIR"

    # Additional library folders are recorded in libraryfolders.vdf
    libraryfolders=$STEAM_DIR/steamapps/libraryfolders.vdf
    # Match directories listed in libraryfolders.vdf (or at least all strings
    # that look like directories)
    grep -oP "(?<=\")/.*(?=\")" $libraryfolders
}

# Generate the contents of a .desktop file for a Steam game.
# Expects appid, title, and box art file to be given as arguments
desktop-entry() {
cat <<EOF
[Desktop Entry]
Name=$2
Exec=steam steam://rungameid/$1
Icon=$3
Terminal=false
Type=Application
Categories=SteamLibrary;
EOF
}

update-game-entries() {
    local OPTIND=1
    local quiet update

    while getopts 'qf' arg
    do
        case ${arg} in
            f) update=1;;
            q) quiet=1;;
            *)
                echo "Usage: $0 [-f] [-q]"
                echo "  -f: Full refresh; update existing entries"
                echo "  -q: Quiet; Turn off diagnostic output"
                exit
        esac
    done

    mkdir -p "$APP_PATH"
    for library in $(steam-libraries); do
        # All installed Steam games correspond with an appmanifest_<appid>.acf file
        if [ -z "$(shopt -s nullglob; echo "$library"/steamapps/appmanifest_*.acf)" ]; then
            # Skip empty library folders
            continue
        fi

        for manifest in "$library"/steamapps/appmanifest_*.acf; do
            appid=$(basename "$manifest" | tr -dc "[0-9]")
            entry=$APP_PATH/${appid}.desktop

            # Don't update existing entries unless doing a full refresh
            if [ -z $update ] && [ -f "$entry" ]; then
                [ -z $quiet ] && echo "Not updating $entry"
                continue
            fi

            title=$(awk -F\" '/"name"/ {print $4}' "$manifest" | tr -d "™®")
            boxart=$STEAM_DIR/appcache/librarycache/${appid}_library_600x900.jpg

            # Filter out non-game entries (e.g. Proton versions or soundtracks) by
            # checking for boxart and other criteria
            if [ ! -f "$boxart" ]; then
                [ -z $quiet ] && echo "Skipping $title"
                continue
            fi
            if echo "$title" | grep -qe "Soundtrack"; then
                [ -z $quiet ] && echo "Skipping $title"
                continue
            fi
            [ -z $quiet ] && echo -e "Generating $entry\t($title)"
            desktop-entry "$appid" "$title" "$boxart" > "$entry"
        done
    done
}

update-game-entries $@
