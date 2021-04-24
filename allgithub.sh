#!/bin/bash

cd "$(dirname "$0")"
OLD_PWD="$PWD"

function allgithub {

    if [ $# -lt 2 ]; then
        cat help.txt
    fi

    USR="$1"
    CRED="$USR:$2"

    rm -rf allgithub times.txt repos.txt
    mkdir allgithub && cd allgithub
    curl -u "$CRED" "https://api.github.com/user/repos?page=1&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | tee -a "$OLD_PWD/repos.txt"
    
    python3 "$OLD_PWD/format_links.py" "$CRED"
    xargs -a "$OLD_PWD/repos.txt" -d '\n' -L1 -P8 git clone

    for repo in */ ; do
        cd $repo

        git log --author="$USR" --date=format:'%Y-%m-%d %H:%M' \
                --pretty=format:"%ad %s ($(basename "$(pwd)"))" >> "$OLD_PWD/times.txt"
        echo >> "$OLD_PWD/times.txt"

        cd ..
    done

    cd $OLD_PWD

    awk 'NF' times.txt > 1.times.txt
    python3 sort_by_date.py < 1.times.txt >| out.txt
    rm -rf ./*times.txt repos.txt allgithub/
}

allgithub "$@"
