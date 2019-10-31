#!/bin/bash

function main () {

    cd /root/course
    
    local venv_path="$HOME/.venvs/chaostk/bin/activate"

    echo "Waiting for environment to be fully updated..."
    for i in {1..70}
    do
        if [ -f $venv_path ]; then
            break
        fi
        sleep 1s
    done

    # when we didn't break from the previous loop, it means the package
    # hasn't been installed yet, let's bail.
    if [ ! -f $venv_path ]; then
        echo "Environment took too long to be prepared. "\
            "Sorry, but you will have to refresh this page and try again :/"
        return 1
    fi
    echo "Environment is now ready"

    if ! source $venv_path; then
        echo "failed to create Python virtual environment"
        return 1
    fi
    
    local samples_git="https://github.com/chaostoolkit/chaostoolkit-samples.git"
    echo "Cloning class samples from ${samples_git}"
    if ! git clone --quiet --depth 1 $samples_git; then
        echo "failed to clone ${samples_git}"
        return 1
    fi

    echo "All set, you can now start your class."
}

main || exit 1
