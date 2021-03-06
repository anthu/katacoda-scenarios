
#!/bin/bash

function main () {
    local samples_git="https://github.com/kaisert/eth-workshop.git"
    echo "Cloning class samples from ${samples_git}"
    if ! git clone --quiet $samples_git; then
        echo "failed to clone ${samples_git}"
        return 1
    fi

    echo "Pre-pulling docker images"
    docker pull python:3-alpine > /dev/null 2>&1 &
    docker pull postgres:alpine > /dev/null 2>&1 &
    docker pull chaostoolkit/reporting > /dev/null 2>&1 &
    
    echo "All set, you can now start your class."
}

main || exit 1