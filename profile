export PS1='$?] \W \$ '

if [ -x /usr/libexec/path_helper ]; then
	export PATH=""
	eval `/usr/libexec/path_helper -s`
fi

# in re gnubin, see
# https://trac.macports.org/browser/trunk/dports/sysutils/coreutils/Portfile
echo $PATH | fgrep -v -q sw &&
	export PATH=/sw/libexec/gnubin:/sw/sbin:/sw/bin:$PATH

# echo $PATH | fgrep -v -q -- google-cloud-sdk &&
# 	. ${HOME}/Projects/google-cloud-sdk/path.bash.inc

echo $PATH | fgrep -v -q $HOME &&
	[ -d ${HOME}/bin ] &&
	export PATH=${HOME}/bin:$PATH

export GOROOT=/go
export GOPATH=$HOME/Projects/go

echo $PATH | fgrep -v -q $GOROOT &&
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
