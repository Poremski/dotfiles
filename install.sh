#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# folders that should be installed by all users including the root user
base=(
    nvim
)

# folders that should be installed by the local user
useronly=(
    sway
)

# run the stow command for the passed in directory ($2) in location $1
stowit() {
    usr=$1
    app=$2
    # -v verbose
    # -R recursive
    # -t target
    stow -v -R -t ${usr} ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps available to local users and root
for app in ${base[@]}; do
    stowit "${HOME}" $app
    if [ $app = "fonts" ]; then
        fc-cache -f -v ~/.fonts
    fi
done

# install only user space folders
for app in ${useronly[@]}; do
    if [[ ! "$(whoami)" = *"root"* ]]; then
        stowit "${HOME}" $app
        if [ $app = "fonts" ]; then
            fc-cache -f -v ~/.fonts
        fi
    fi
done

echo ""
echo "##### ALL DONE"
