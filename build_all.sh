#!/bin/bash

./rtracker_download.sh

# Store the original directory
ORIGINAL_DIR="$PWD"

shopt -s expand_aliases
alias rt="$PWD/rtracker"

# Loop through each item in the current directory
for dir in */; do
    # Check if it's actually a directory (in case no directories exist)
    if [ $dir == "EXAMPLE/" ]; then
        continue
    fi
    if [ -d "$dir" ]; then
#        echo "Entering directory: $dir"
        cd "$dir" || continue
        rt "Building $dir" \
            %% abuild -r

        cd "$ORIGINAL_DIR"
    fi
done

echo "Completed processing all directories."
echo "Output in: $HOME/packages/ctos_packages/x86_64/"
