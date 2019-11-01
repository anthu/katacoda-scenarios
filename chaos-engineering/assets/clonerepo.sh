
#!/bin/bash

function main () {
    local samples_git="https://github.com/kaisert/eth-workshop.git"
    echo "Cloning class samples from ${samples_git}"
    if ! git clone --quiet --depth 1 $samples_git; then
        echo "failed to clone ${samples_git}"
        return 1
    fi
    
    echo "All set, you can now start your class."
}

main || exit 1