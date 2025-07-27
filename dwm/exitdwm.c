
# include <stdio.h>
# include <string.h>

void exitdwm ()
{
# if							   \
	defined S_LOCK				|| \
	defined S_RESTART_DWM		|| \
	defined S_RESTART_X			|| \
	defined S_OFFSCREEN			|| \
	defined S_EXIT				|| \
	defined S_REBOOT			|| \
	defined S_SHUTDOWN			|| \
	defined S_FORMAT			|| \
	defined S_FORMAT_CLEAR
# error (conflicting macro names)
# endif

# define S_EXIT "exit"
# define S_LOCK "sleep"
# define S_REBOOT "reboot"
# define S_SHUTDOWN "shutdown"
# define S_RESTART_X "restart-x"
# define S_OFFSCREEN "off-screen"
# define S_RESTART_DWM "restart-dwm"

# define S_FORMAT(ACTION) S_##ACTION
# define S_FORMAT_CLEAR "cat"

	FILE * exit_menu = popen (
		"echo \""
			S_FORMAT (LOCK) "\n"
			S_FORMAT (RESTART_DWM) "\n"
			S_FORMAT (RESTART_X) "\n"
			S_FORMAT (OFFSCREEN) "\n"
			S_FORMAT (EXIT) "\n"
			S_FORMAT (REBOOT) "\n"
			S_FORMAT (SHUTDOWN)
			"\" | dmenu -p exit: | " S_FORMAT_CLEAR
		,
		"r"
	);

	char exit_action [16];

	if (
		exit_menu == NULL ||
		fscanf (exit_menu, "%15[a-zA-Z -]", exit_action) == EOF
	) {
		fputs ("Error. Failure in exit_dwm.", stderr);
		goto close_streams;
	}

	if (strcmp (exit_action, S_LOCK) == 0) system ("sudo systemctl hybrid-sleep");
	else if (strcmp (exit_action, S_EXIT) == 0) quit (& (const Arg) {0});
	else if (strcmp (exit_action, S_REBOOT) == 0) system ("systemctl reboot");
	else if (strcmp (exit_action, S_RESTART_DWM) == 0) quit (& (const Arg) {1});
	else if (strcmp (exit_action, S_SHUTDOWN) == 0) system ("systemctl poweroff -i");
	else if (strcmp (exit_action, S_OFFSCREEN) == 0) system ("sleep .5; xset dpms force off");
	else if (strcmp (exit_action, S_RESTART_X) == 0) system ("loginctl terminate-user $(whoami)");

close_streams:
	pclose (exit_menu);

# undef S_LOCK
# undef S_RESTART_DWM
# undef S_OFFSCREEN
# undef S_EXIT
# undef S_REBOOT
# undef S_SHUTDOWN
# undef S_FORMAT
# undef S_FORMAT_CLEAR
}
