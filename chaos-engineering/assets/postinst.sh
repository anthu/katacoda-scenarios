#!/bin/bash

function main () {
    apt-get update
    apt-get install -y python3-dev python3-venv libssl-dev
    mkdir ~/.venvs
    python3 -m venv ~/.venvs/chaostk
    source ~/.venvs/chaostk/bin/activate
    pip install -q -U chaostoolkit

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
    
    echo "Environment prepared."
}

main || exit 1
