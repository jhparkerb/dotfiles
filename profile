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
	[ -d /sw ] &&
	export PATH=/sw/libexec/gnubin:/sw/sbin:/sw/bin:$PATH

echo $PATH | fgrep -v -q ${HOME}/bin &&
	[ -d ${HOME}/bin ] &&
	export PATH=${HOME}/bin:$PATH

export GOROOT=/go
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
