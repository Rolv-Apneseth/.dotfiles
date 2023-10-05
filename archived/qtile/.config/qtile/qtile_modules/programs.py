from os import environ


# Helper Functions
def get_program(environment_variable: str, backup: str = "") -> str:
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
    launcher=get_program("MY_LAUNCHER"),
    games_launcher=get_program("MY_GAMES_LAUNCHER"),
    clipboard=get_program("MY_CLIPBOARD"),
    calculator=get_program("MY_CALCULATOR"),
    selector_default_sound_sink=get_program("MY_SELECTOR_DEFAULT_SOUND_SINK"),
    fonts_explorer=get_program("MY_FONTS_EXPLORER"),
    file_explorer=get_program("MY_EXPLORER"),
    email_client=get_program("MY_EMAIL_CLIENT"),
    work_communication=get_program("MY_WORK_COMMUNICATION"),
    screenshot=get_program("MY_SCREENSHOT"),
    volume_manager=get_program("MY_VOLUME_MANAGER"),
    media_player=get_program("MY_MEDIA_PLAYER"),
    music_client=get_program("MY_MUSIC_CLIENT"),
    music_toggle=get_program("MY_MUSIC_TOGGLE"),
    music_next=get_program("MY_MUSIC_NEXT"),
    music_prev=get_program("MY_MUSIC_PREV"),
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
        "https://stackoverflow.com/questions/tagged?sort=Newest&filters=NoAnswers&"
        "tagMode=Watched&uqlId=33538"
    ),
    github=get_site("https://github.com/Rolv-Apneseth"),
    youtube=get_site("https://www.youtube.com/"),
)

if __name__ == "__main__":
    # Print out programs, for quick debugging
    from pprint import pprint

    pprint(PROGRAMS)
    pprint(WEBSITES)
