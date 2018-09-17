# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function git-branch-name

{

        git symbolic-ref HEAD 2>/dev/null | awk -F/ '{printf "%s",$NF}'

}

 

export PS1='[\[\e[0;37m\]\d \t\[\e[m\] \[\[\e[0;37m\]\u\[\e[m\]\e[m\]@\[\e[0;32m\]MAIN \[\e[1;31m\]\w\[\e[m\]]\n($?$(if git log -1 --oneline > /dev/null 2>&1; then echo -n ")-(\[\e[0;36m\]"; git-branch-name; if cnt=$(git cherry 2>/dev/null | wc -l); then if test $cnt -gt 0; then echo -n " $cnt"; echo -ne "\xdf\xa1"; fi; git update-index -q --refresh >/dev/null 2>&1; test -z "$(git diff-index --name-only HEAD --)" || (echo -ne " \xE2\x99\xA5"); echo "\[\e[m\]"; fi; fi)) \[\e[1;30m\]\\$ \[\e[m\]'



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
# This is for building origin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export OS_OUTPUT_GOPATH=1
# jason agent stuff
export PATH=/home/mmarusak/Downloads/jason-2.2a/scripts/:$PATH
# mpi
export PATH=/usr/lib64/openmpi/bin/:$PATH
# minishift
export PATH=/home/mmarusak/minishift-1.18.0-linux-amd64:$PATH
export JDK_HOME=/usr/local

export REQUESTS_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt1

# User specific aliases and functions
alias gits='git status'
alias giff='git diff'
alias gitl='git log --oneline'
alias abrt_down='sudo dnf -y remove abrt abrt-cli libreport libreport-cli satyr'
alias abrt_up='sudo dnf -y --nogpgcheck install abrt-desktop abrt abrt-cli libreport* satyr satyr-devel'
alias docker_crash='docker run fedora /usr/bin/bash -c "timeout -s ABRT 1 sleep 10"'
alias fuckup_abrt='pushd ~/ABRT/abrt && rm -rf build && ./autogen.sh && make rpm && cd build/x86_64 && rm abrt-atomic* && sudo rpm -Uvh --force ./* && popd'
alias cleanup-docker='docker rm -f $(docker ps -a -q) && docker rmi -f $(docker images -q)'
alias cim='vim'
alias bim='vim'
alias fn="firefox-nightly >/dev/null 2>&1 &"
