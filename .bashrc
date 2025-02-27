for file in /etc/bash_completion.d/* ; do
    source "$file"
done
source /usr/share/bash-completion/completions/git

function git-branch-name

{
        git symbolic-ref HEAD 2>/dev/null | awk -F/ '{printf "%s",$NF}'
}

export PS1='[\d \t \[\e[0;34m\]\u\[\e[m\] \[\e[0;31m\]\w\[\e[m\]]\n($?$(if git log -1 --oneline > /dev/null 2>&1; then echo -n ")-(\[\e[0;36m\]"; git-branch-name; if cnt=$(git cherry 2>/dev/null | wc -l); then if test $cnt -gt 0; then echo -n " $cnt"; echo -ne "\xdf\xa1"; fi; git update-index -q --refresh >/dev/null 2>&1; test -z "$(git diff-index --name-only HEAD --)" || (echo -ne " \xE2\x99\xA5"); echo "\[\e[m\]"; fi; fi)) \[\e[0;33m\]\\$ \[\e[m\]'

# User specific aliases and functions
alias gits='git status'
alias giff='git diff'
alias gitl='git log --oneline'
alias cim='vim'
alias bim='vim'
alias autogen="./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-strict --enable-debug"
