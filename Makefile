RM ?= rm -f -r

clean:
        $(RM) j0find *

install_colors: bash_colors

bash_colors:
	shell_script setup_bash_colors.sh
