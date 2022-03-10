from os import environ


def get_program(environment_variable: str, backup: str) -> str:
    return environ.get(environment_variable, default=backup)


def get_terminal_program(program: str) -> str:
    return f"{PROGRAMS['terminal']} -e {program}"


def get_site(url: str) -> str:
    return f'{PROGRAMS["browser"]} {url}'


# Set used programs and commands
PROGRAMS = dict(
    terminal=get_program("TERMINAL", "xterm"),
    browser=get_program("BROWSER", "firefox"),
    launcher=get_program("MY_LAUNCHER", "rofi -show run"),
    file_explorer=get_program("MY_EXPLORER", "thunar"),
    email_client=get_program("MY_EMAIL_CLIENT", "thunderbird"),
    work_communication=get_program("MY_WORK_COMMUNICATION", "skypeforlinux"),
    screenshot=get_program("MY_SCREENSHOT", "flameshot gui"),
    volume_manager=get_program("MY_VOLUME_MANAGER", "pavucontrol"),
    system_monitor="psensor",
    volume_toggle="amixer set Master toggle",
    wallpaper_manager="variety",
)
# Update with terminal programs (requires terminal to be defined first)
PROGRAMS.update(
    dict(
        editor=get_terminal_program(get_program("EDITOR", "nvim")),
        tech_news=get_terminal_program("daily_hn"),
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
)

if __name__ == "__main__":
    # Print out programs, for debugging
    from pprint import pprint

    pprint(PROGRAMS)
    pprint(WEBSITES)
