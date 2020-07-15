# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function git-branch-name

{

        git symbolic-ref HEAD 2>/dev/null | awk -F/ '{printf "%s",$NF}'

}

 

export PS1='$(if test $HOSTNAME = "toolbox"; then echo -n "🔹[\u@\h \W]\\$ "; fi;)[\[\e[0;37m\]\d \t\[\e[m\] \[\[\e[0;37m\]\u\[\e[m\]\e[m\]@\[\e[0;32m\]MAIN \[\e[1;31m\]\w\[\e[m\]]\n($?$(if git log -1 --oneline > /dev/null 2>&1; then echo -n ")-(\[\e[0;36m\]"; git-branch-name; if cnt=$(git cherry 2>/dev/null | wc -l); then if test $cnt -gt 0; then echo -n " $cnt"; echo -ne "\xdf\xa1"; fi; git update-index -q --refresh >/dev/null 2>&1; test -z "$(git diff-index --name-only HEAD --)" || (echo -ne " \xE2\x99\xA5"); echo "\[\e[m\]"; fi; fi)) \[\e[1;30m\]\\$ \[\e[m\]'

# Cockpit stuff
export REQUESTS_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt1
export REQUESTS_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt
export GITHUB_BASE=cockpit-project/cockpit

# User specific aliases and functions
alias gits='git status'
alias giff='git diff'
alias gitl='git log --oneline'
alias cim='vim'
alias bim='vim'
alias autogen="./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-strict --enable-debug"
