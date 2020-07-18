export PS1='$?] \W \$ '

if [ -x /usr/libexec/path_helper ]; then
	export PATH=""
	eval `/usr/libexec/path_helper -s`
fi

# let google put its cloud stuff "first" and then move everything else in
# front; system directories are still masked but ... meh.
echo $PATH | fgrep -v -q -- google-cloud-sdk &&
	[ -f ${HOME}/Projects/google-cloud-sdk/path.bash.inc ] &&
	. ${HOME}/Projects/google-cloud-sdk/path.bash.inc

# in re gnubin, see
# https://trac.macports.org/browser/trunk/dports/sysutils/coreutils/Portfile
echo $PATH | fgrep -v -q sw &&
	[ -d /sw/bin ] &&
	export PATH=/sw/libexec/gnubin:/sw/sbin:/sw/bin:$PATH

echo $PATH | fgrep -v -q sw &&
	[ -d /opt/local/bin ] &&
	export PATH=/opt/local/libexec/gnubin:/opt/local/sbin:/opt/local/bin:$PATH

echo $PATH | fgrep -v -q ${HOME}/bin &&
	[ -d ${HOME}/bin ] &&
	export PATH=${HOME}/bin:$PATH

# gnupg v2 needs GPG_TTY set to use pinentry-curses; why there's no reasonable
# default provided is, of course, a complete god-damn mystery.
[ -f /opt/local/bin/pinentry-curses -o -f /sw/bin/pinentry-curses ] && \
	export GPG_TTY=$(tty) || true

which lesspipe >/dev/null 2>&1 && eval $(lesspipe)

ls --color / >/dev/null 2>&1 && alias ls='ls --color=auto -p'
