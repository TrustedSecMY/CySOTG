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

# Function to remove Kali Linux repositories and GPG keys
remove_kali_repositories() {
    echo "Removing Kali Linux repositories and GPG keys..."
    sudo rm /etc/apt/sources.list.d/kali.list
    sudo apt-key del ED444FF07D8D0BF6
}

# Function to update repositories
update_repositories() {
    echo "Updating repositories..."
    sudo apt-get update
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
echo "Choose an action:"
echo "1. Add Kali repositories and import GPG keys"
echo "2. Remove Kali repositories and GPG keys"
echo "3. Update repositories"
echo "4. List Kali Linux tools"
echo "5. Install Kali Linux tools by group"
echo "6. Install Kali Linux tools individually"
read choice

case $choice in
    1)
        add_kali_repositories
        import_gpg_keys
        ;;
    2)
        remove_kali_repositories
        ;;
    3)
        update_repositories
        ;;
    4)
        list_kali_tools
        ;;
    5)
        install_tools_by_group
        ;;
    6)
        install_tool_individually
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac
