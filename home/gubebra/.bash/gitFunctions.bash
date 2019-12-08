
#================================================================

#github
git_status(){
    status=""
    var="$(git_branch)"
    if [ ! -z "$var" ]
    then
        local git_status="$(git status 2> /dev/null)"

        if [[ ! $git_status =~ "Your branch is up to date with 'origin/master'." ]]; then
            status="=!"

        elif [[ $git_status =~ "Your branch is ahead of 'origin/master' by" ]]; then
            status="+"

        elif [[ $git_status =~ "Changes not staged for commit:" || $git_status =~ "Untracked files:" || $git_status =~ "Changes to be committed:" ]]; then
            status="!="

        elif [[ $git_status =~ "nothing to commit" ]]; then
            status="="

        else
            status="="

        fi
    fi
    echo $status
}

git__(){
    var="$(git_branch)"
    if [ ! -z "$var" ]
    then
        echo "}"
    fi
}

git_(){
    var="$(git_branch)"
    if [ ! -z "$var" ]
    then
        echo "{"
    fi
}

git_color(){
    color="\033[0;32m"
    var="$(git_branch)"
    if [ ! -z "$var" ]
    then
        local git_status="$(git status 2> /dev/null)"

        if [[ ! $git_status =~ "Your branch is up to date with 'origin/master'." ]]; then
            color="\033[0;33m"

        elif [[ $git_status =~ "Your branch is ahead of 'origin/master' by" ]]; then
            color="\033[0;34m"

        elif [[ $git_status =~ "Changes not staged for commit:" || $git_status =~ "Untracked files:" || $git_status =~ "Changes to be committed:" ]]; then
            color="\033[0;31m"

        elif [[ $git_status =~ "nothing to commit" ]]; then
            color="\033[0;32m"

        else
            color="\033[0;32m"

        fi
    fi
    echo -e $color

}

git_branch() {

    a="$(git branch 2> /dev/null | grep ^\* | cut -d'*' -f2 | cut -d' ' -f2)"

    if [ ! -z "$a" ]
    then
        echo "$a"
    fi

}

#=============================================================================
