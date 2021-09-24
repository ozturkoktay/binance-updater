#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
os=$(uname -s);

if [ "$os" = "Linux" ]; 
then
    read -p '# Is your OS Debian Based (Ubuntu, Linux Mint., Kali etc.)? Yes or No: ' answer
    answer=${answer^^}

    if [ "$answer" = "YES" ]; 
    then
        
        FILENAME="$DIR/latest_binance.deb";    
        URL="https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb";
        
        echo "## Closing Binance ...";
        for pid in $(pidof binance); do kill -9 $pid; done
        echo "## Binance instance(s) closed.";
        if test -d "$INSTALLPATH"; then
            sudo rm -rf $INSTALLPATH;
            echo "## Removed last installed version.";
        fi
        if test -e "$FILENAME"; then
            rm $FILENAME;
            rm -rf $FOLDERNAME;
            echo "## Removed last downloaded version.";
        fi
        
        echo "## Downloading latest version of Binance is starting...";
        wget -q --show-progress -O $FILENAME $URL;
        echo "## Downloading finished.";
        echo "## Installing...";
        sudo dpkg -i $FILENAME;
        echo "## Installation finished.";
    else
        FILENAME="$DIR/latest_binance.rpm";    
        URL="https://ftp.binance.com/electron-desktop/linux/production/binance-x86_64-linux.rpm";
        
        echo "## Closing Binance ...";
        for pid in $(pidof binance); do kill -9 $pid; done
        echo "## Binance instance(s) closed.";
        if test -d "$INSTALLPATH"; then
            sudo rm -rf $INSTALLPATH;
            echo "## Removed last installed version.";
        fi
        if test -e "$FILENAME"; then
            rm $FILENAME;
            rm -rf $FOLDERNAME;
            echo "## Removed last downloaded version.";
        fi
        
        echo "## Downloading latest version of Binance is starting...";
        wget -q --show-progress -O $FILENAME $URL;
        echo "## Downloading finished.";
        echo "## Installing...";
        sudo rpm -ivh $FILENAME;
        echo "## Installation finished.";
    fi
else
    echo "## This script is only for Linux.";
    exit;
fi