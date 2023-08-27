#!/bin/bash

while true; do
    clear
    echo "Menu:"
    echo "1. Basic Commands"
    echo "2. Networking Commands"
    echo "3. SSH Commands"
    echo "4. Docker Commands"
    echo "5. Exit"
    
    read -p "Enter your choice: " choice

    case $choice in
        1)
            clear
            echo "Basic Commands:"
            echo "a. Add User"
            echo "b. Set Password"
            echo "c. Who Am I"
            echo "d. Print Directory"
            echo "e. Create Directory"
            echo "f. Remove Directory"
            echo "g. Say Cheese!"
            echo "h. Open SSH"
            echo "i. Yum WhatProvides"
            echo "j. Yum Install"
            echo "k. Open Terminal"
            
            read -p "Enter your choice (a-k): " basic_choice

            case $basic_choice in
                a)
                    read -p "Enter username: " username
                    sudo adduser $username
                    ;;
                b)
                    read -p "Enter username: " username
                    sudo passwd $username
                    ;;
                c)
                    whoami
                    read -p "Press Enter to continue..."
                    ;;
                d)
                    pwd
                    read -p "Press Enter to continue..."
                    ;;
                e)
                    read -p "Enter directory name: " dirname
                    mkdir $dirname
                    ;;
                f)
                    read -p "Enter directory name to remove: " dirname
                    rm -rf $dirname
                    ;;
                g)
                    echo "Cheese!"
                    ;;
                h)
                    sudo systemctl start sshd
                    ;;
                i)
                    read -p "Enter package name: " package
                    yum whatprovides $package
                    ;;
                j)
                    read -p "Enter package name to install: " package
                    sudo yum install $package
                    ;;
                k)
                    gnome-terminal
                    ;;
                *)
                    echo "Invalid choice"
                    ;;
            esac
            ;;
        2)
            clear
            echo "Networking Commands:"
            echo "a. Show Network"
            echo "b. Ping Host"
            echo "c. Lookup DNS"
            echo "d. Send Custom Ping"
            
            read -p "Enter your choice (a-d): " net_choice

            case $net_choice in
                a)
                    ifconfig
                    read -p "Press Enter to continue..."
                    ;;
                b)
                    read -p "Enter host to ping: " host
                    ping $host
                    read -p "Press Enter to continue..."
                    ;;
                c)
                    read -p "Enter domain to lookup: " domain
                    nslookup $domain
                    read -p "Press Enter to continue..."
                    ;;
                d)
                    read -p "Enter IP to ping: " ip
                    read -p "Enter message in hex: " message
                    ping -p $message $ip
                    read -p "Press Enter to continue..."
                    ;;
                *)
                    echo "Invalid choice"
                    ;;
            esac
            ;;
        3)
            clear
            echo "SSH Commands:"
            echo "a. SSH Connect"
            echo "b. SCP Transfer"
            echo "c. Execute Remote Command"
            
            read -p "Enter your choice (a-c): " ssh_choice

            case $ssh_choice in
                a)
                    read -p "Enter remote server IP: " remote_ip
                    ssh $remote_ip
                    ;;
                b)
                    read -p "Enter source file: " source_file
                    read -p "Enter destination file: " dest_file
                    scp $source_file $dest_file
                    ;;
                c)
                    read -p "Enter remote server IP: " remote_ip
                    read -p "Enter command to execute: " command
                    ssh $remote_ip "$command"
                    ;;
                *)
                    echo "Invalid choice"
                    ;;
            esac
            ;;
        4)
            clear
            echo "Docker Commands:"
            echo "a. Install Docker"
            echo "b. Pull Docker Image"
            echo "c. Run Docker Container"
            
            read -p "Enter your choice (a-c): " docker_choice

            case $docker_choice in
                a)
                    sudo yum install docker
                    sudo systemctl start docker
                    sudo systemctl enable docker
                    ;;
                b)
                    read -p "Enter Docker image name: " image_name
                    docker pull $image_name
                    ;;
                c)
                    read -p "Enter Docker image name: " image_name
                    docker run -it $image_name
                    ;;
                *)
                    echo "Invalid choice"
                    ;;
            esac
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done
