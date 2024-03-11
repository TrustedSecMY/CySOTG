#!/bin/bash

# Function to add Kali Linux repositories
add_kali_repositories() {
    echo "Adding Kali Linux repositories..."
    echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list.d/kali.list > /dev/null
}

# Function to import Kali Linux GPG keys
import_gpg_keys() {
    echo "Importing Kali Linux GPG keys..."
    sudo wget 'https://archive.kali.org/archive-key.asc' -O /tmp/kali-archive-key.asc
    sudo apt-key add /tmp/kali-archive-key.asc
}

# Function to list Kali tools
list_kali_tools() {
    echo "Listing Kali Linux tools..."
    apt-cache search kali-linux
}

# Function to install Kali tools by group
install_tools_by_group() {
    echo "Enter the group name to install (e.g., kali-linux-top10): "
    read group_name
    sudo apt-get install $group_name
}

# Function to install Kali tools individually
install_tool_individually() {
    echo "Enter the tool name to install (e.g., kali-linux-web): "
    read tool_name
    sudo apt-get install $tool_name
}

# Main script
add_kali_repositories
import_gpg_keys

echo "Do you want to list Kali Linux tools? (yes/no)"
read list_tools_choice
if [[ $list_tools_choice == "yes" ]]; then
    list_kali_tools
fi

echo "Do you want to install Kali Linux tools by group or individually? (group/individual)"
read install_choice
if [[ $install_choice == "group" ]]; then
    install_tools_by_group
elif [[ $install_choice == "individual" ]]; then
    install_tool_individually
else
    echo "Invalid choice. Exiting..."
    exit 1
fi
