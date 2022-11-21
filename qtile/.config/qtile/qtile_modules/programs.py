from os import environ


# Helper Functions
def get_program(environment_variable: str, backup: str) -> str:
    return environ.get(environment_variable, default=backup)


def get_terminal_program(program: str) -> str:
    return f"{PROGRAMS['terminal']} -e {program}"


def get_site(url: str) -> str:
    return f"{PROGRAMS['browser']} {url}"


def get_program_in_last_dir(program: str) -> str:
    return f'{program} "$(last_dir)"'


# Set used programs and commands
PROGRAMS = dict(
    terminal=get_program("TERMINAL", "xterm"),
    browser=get_program("BROWSER", "firefox"),
    launcher=get_program("MY_LAUNCHER", "rofi -show run"),
    games_launcher=get_program("MY_GAMES_LAUNCHER", "rofi -show drun"),
    clipboard=get_program("MY_CLIPBOARD", "rofi -show drun"),
    file_explorer=get_program("MY_EXPLORER", "thunar"),
    email_client=get_program("MY_EMAIL_CLIENT", "thunderbird"),
    work_communication=get_program("MY_WORK_COMMUNICATION", "skypeforlinux"),
    screenshot=get_program("MY_SCREENSHOT", "flameshot gui"),
    volume_manager=get_program("MY_VOLUME_MANAGER", "pavucontrol"),
    media_player=get_program("MY_MEDIA_PLAYER", "mpv"),
    play_music=get_program("MY_MUSIC_PLAYER", "audacious"),
    system_monitor="psensor",
    volume_toggle="change_volume toggle",
    volume_increase="change_volume 5%+ unmute",
    volume_decrease="change_volume 5%- unmute",
    wallpaper_manager="variety",
)
# Update levels since there are programs/commands that require others to be defined first
PROGRAMS.update(
    dict(
        editor=get_terminal_program(get_program("EDITOR", "nvim")),
        tech_news=get_terminal_program("daily_hn"),
    )
)
PROGRAMS.update(
    dict(
        terminal_last_dir=get_program_in_last_dir(PROGRAMS["terminal"]),
        editor_last_dir=get_program_in_last_dir(PROGRAMS["editor"]),
        file_explorer_last_dir=get_program_in_last_dir(PROGRAMS["file_explorer"]),
    )
)

# Set commands used to open useful websites
WEBSITES = dict(
    stack_overflow=get_site(
        "https://stackoverflow.com/questions/tagged/python?sort=Newest&filters=NoAnswers"
        "&uqlId=33538"
    ),
    github=get_site("https://github.com/Rolv-Apneseth"),
    youtube=get_site("https://www.youtube.com/"),
    netflix=get_site("https://www.netflix.com/"),
    arch_wiki=get_site("https://wiki.archlinux.org/"),
)

if __name__ == "__main__":
    # Print out programs, for quick debugging
    from pprint import pprint

    pprint(PROGRAMS)
    pprint(WEBSITES)
