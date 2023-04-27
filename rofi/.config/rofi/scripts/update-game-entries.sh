#!/usr/bin/env bash

# Generates .desktop entries for all installed Steam games with box art for
# the icons to be used with a specifically configured Rofi launcher

STEAM_DIR="$HOME/.local/share/Steam"
APP_PATH="$XDG_DATA_HOME/applications"

# Generate the contents of a .desktop file for a Steam game.
# Expects appid, title, and box art file to be given as arguments
desktop-entry()
{
    cat << EOF
[Desktop Entry]
Name=$2
Exec=steam steam://rungameid/$1
Icon=$3
Terminal=false
Type=Application
Categories=SteamLibrary;
EOF
}

update_game_entries()
{
    local OPTIND=1
    local quiet update

    while getopts 'qf' arg; do
        case ${arg} in
            f) update=1 ;;
            q) quiet=1 ;;
            *)
                echo "Usage: $0 [-f] [-q]"
                echo "  -f: Full refresh; update existing entries"
                echo "  -q: Quiet; Turn off diagnostic output"
                exit
                ;;
        esac
    done

    mkdir -p "$APP_PATH"

    # Keep track of appids of located games, to be used for removing old entries
    # located_apppids=()

    # Loop over steam library folders
    grep -oP "(?<=\")/.*(?=\")" "$STEAM_DIR/steamapps/libraryfolders.vdf" | while read -r library; do
        # All installed Steam games correspond with an appmanifest_<appid>.acf file
        if [ "$(
            shopt -s nullglob
            echo "$library"/steamapps/appmanifest_*.acf
        )" = "" ]; then
            # Skip empty library folders
            continue
        fi

        for manifest in "$library"/steamapps/appmanifest_*.acf; do
            appid=$(basename "$manifest" | tr -dc "\[0-9\]")
            located_apppids+=("$appid")
            entry=$APP_PATH/${appid}.desktop

            # Don't update existing entries unless doing a full refresh
            if [ "$update" = "" ] && [ -f "$entry" ]; then
                [ "$quiet" = "" ] && echo "Not updating $entry"
                continue
            fi

            title=$(awk -F\" '/"name"/ {print $4}' "$manifest" | tr -d "™®")
            boxart=$STEAM_DIR/appcache/librarycache/${appid}_library_600x900.jpg

            # Filter out non-game entries (e.g. Proton versions or soundtracks) by
            # checking for boxart and other criteria
            if [ ! -f "$boxart" ]; then
                [ "$quiet" = "" ] && echo "Skipping $title"
                continue
            fi
            if echo "$title" | grep -qe "Soundtrack"; then
                [ "$quiet" = "" ] && echo "Skipping $title"
                continue
            fi
            [ "$quiet" = "" ] && echo -e "Generating $entry\t($title)"
            desktop-entry "$appid" "$title" "$boxart" > "$entry"
        done
    done

    # Remove old entries
    # for appid in "${located_apppids[@]}"; do
    #     echo appid
    # done
}

update_game_entries "$@"
