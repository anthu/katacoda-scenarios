
#!/bin/bash

function main () {
    local samples_git="https://github.com/kaisert/eth-workshop.git"
    echo "Cloning class samples from ${samples_git}"
    if ! git clone --quiet $samples_git; then
        echo "failed to clone ${samples_git}"
        return 1
    fi

    echo "Pre-pulling docker images"
    docker pull python:3-alpine &
    docker pull postgres:alpine &

    echo "All set, you can now start your class."
}

main || exit 1