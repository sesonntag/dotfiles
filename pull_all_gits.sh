#!/bin/bash
set -o pipefail

# Script to run `git pull` inside all subdirectories which are git repositories.
# usage 1: keep local changes, then up to date.
#   $ bash ./git-pull.sh
# usage 2: abort local changes, reset if possible, then up to date.
#   $ bash ./git-pull.sh --force --no-stash
# usage 3: try keep local changes, reset if possible, then up to date.
#   $ bash ./git-pull.sh --force

while [ $# -gt 0 ]; do
    case $1 in
        --force) _FORCE=true; shift 1; ;;
        --no-stash) _NO_STASH=true; shift 1; ;;
        *) shift ;;
    esac
done

## find is not a good way to control. Additionally, this include CURRENT directory and it is unexpected.
# find . -maxdepth 1 -type d -exec bash -c 'echo "Working on $(realpath $1)"; git reset --force; git pull' shell {} \;

for dir in ./Code/*/*/; do
    echo "--- Working on \"$(realpath "${dir}")\""
    pushd "$(realpath "${dir}")" > /dev/null
        if [[ ! -d ".git" ]]; then
            echo "  x: \"$(realpath "${dir}")\" is not a git repository, continue next directory."
            popd > /dev/null
            continue
        fi
        if [[ "${_NO_STASH:=false}" != "true" ]]; then git stash --quiet; fi
        if [[ "${_FORCE:=false}" == "true" ]]; then git reset --hard; fi
        git pull
        if [[ "${_NO_STASH:=false}" != "true" ]]; then git stash apply --quiet; fi
    popd > /dev/null
done
