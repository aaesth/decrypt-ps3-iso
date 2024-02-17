#!/bin/bash

echo checking for libray
# check if libray is installed
if ! command -v libray &>/dev/null; then
    echo "error: libray is not installed"
    echo "install it using pip install libray."
    echo "if you did install it before running this command, try restarting your shell."
    exit 1
fi

# if the library is installed
echo "libray is installed"

# title bar or something
echo decrypt-ps3-iso

# ask the user of the filename
read -p "enter the filename of the iso file: " filename

# check if the file exists
if [ ! -f "$filename" ]; then
    echo "error: file '$filename' does not exist."
    exit 1
fi

# extract the game name from the filename, assuming that the game name is before the .iso
game_name=$(echo "$filename" | cut -d. -f1)

# run the decryption command
libray -i "./$filename" -o "$game_name-decrypted.iso"

# tell the user the game has been decrypted and tell them how to extract it 
echo "$game_name has been decrypted, to extract the contents, you can run 7x $game_name-decrypted.iso and it would extract the contents to the same folder you are in."
