#!/bin/bash
echo -e "\x1b[1;32mWireLurker Cleaner"
echo -e "\x1b[1;32mAll file will backup in ~/ppappinstaller"

flag=0
mkdir -p ~/ppappinstaller/Library/LaunchDaemons ~/ppappinstaller/usr/bin ~/ppappinstaller/usr/local

if [ -e /Library/LaunchDaemons/com.apple.globalupdate.plist ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning globalupdate.plist"
    sudo launchctl unload /Library/LaunchDaemons/com.apple.globalupdate.plist
    sudo mv /Library/LaunchDaemons/com.apple.globalupdate.plist ~/ppappinstaller/Library/LaunchDaemons
    sudo mv /usr/bin/globalupdate ~/ppappinstaller/usr/bin
fi

if [ -e /Library/LaunchDaemons/com.apple.itunesupdate.plist ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning itunesupdate.plist"
    sudo launchctl unload /Library/LaunchDaemons/com.apple.itunesupdate.plist
    sudo mv /Library/LaunchDaemons/com.apple.itunesupdate.plist ~/ppappinstaller/Library/LaunchDaemons
    sudo mv /usr/bin/itunesupdate ~/ppappinstaller/usr/bin
fi


if [ -e /Library/LaunchDaemons/com.apple.machook_damon.plist ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning machook_damon.plist"
    sudo launchctl unload /Library/LaunchDaemons/com.apple.machook_damon.plist
    sudo mv /Library/LaunchDaemons/com.apple.machook_damon.plist ~/ppappinstaller/Library/LaunchDaemons
    sudo mv /usr/local/machook ~/ppappinstaller/usr/local/machook
    sudo mv /usr/bin/globalupdate/usr/local/machook ~/ppappinstaller/usr/bin/machook
fi


if [ -e /Library/LaunchDaemons/com.apple.watchproc.plist ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning watchproc.plist"
    sudo launchctl unload /Library/LaunchDaemons/com.apple.watchproc.plist
    sudo mv /Library/LaunchDaemons/com.apple.watchproc.plist ~/ppappinstaller/Library/LaunchDaemons
    sudo mv /usr/bin/WatchProc ~/ppappinstaller/usr/bin/
fi

if [ -e /System/Library/LaunchDaemons/com.apple.appstore.plughelper.plist ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning appstore.plughelper.plist"
    sudo launchctl unload /System/Library/LaunchDaemons/com.apple.appstore.plughelper.plist
    sudo mv /System/Library/LaunchDaemons/com.apple.appstore.plughelper.plist ~/ppappinstaller/Library/LaunchDaemons
    sudo mv /usr/bin/com.apple.MailServiceAgentHelper ~/ppappinstaller/usr/bin/
fi

if [ -e /System/Library/LaunchDaemons/com.apple.MailServiceAgentHelper.plist ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning MailServiceAgentHelper.plist"
    sudo launchctl unload /System/Library/LaunchDaemons/com.apple.MailServiceAgentHelper.plist
    sudo mv /System/Library/LaunchDaemons/com.apple.MailServiceAgentHelper.plist ~/ppappinstaller/Library/LaunchDaemons
    sudo mv /usr/bin/com.apple.MailServiceAgentHelper ~/ppappinstaller/usr/bin/
fi

if [ -e /System/Library/LaunchDaemons/com.apple.systemkeychain-helper.plist ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning systemkeychain-helper.plist"
    sudo launchctl unload /System/Library/LaunchDaemons/com.apple.systemkeychain-helper.plist
    sudo mv /System/Library/LaunchDaemons/com.apple.systemkeychain-helper.plist ~/ppappinstaller/Library/LaunchDaemons
    sudo mv /usr/bin/systemkeychain-helper ~/ppappinstaller/usr/bin/
fi

if [ -e /System/Library/LaunchDaemons/com.apple.periodic-dd-mm-yy.plist ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning periodicdate.plist"
    sudo launchctl unload /System/Library/LaunchDaemons/com.apple.periodic-dd-mm-yy.plist
    sudo mv /System/Library/LaunchDaemons/com.apple.periodic-dd-mm-yy.plist ~/ppappinstaller/Library/LaunchDaemons
    sudo mv /usr/bin/periodicdate ~/ppappinstaller/usr/bin/
fi

if [ -d /usr/local/ipcc ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning ipcc"
    sudo mv /usr/local/ipcc ~/ppappinstaller/usr/local/ipcc
fi

if [ -e /Users/Shared/run.sh ]; then
    flag=1
    echo -e "\x1b[1;31mCleaning run.sh"
    sudo mv /Users/Shared/run.sh ~/ppappinstaller/
fi

if [ -e /usr/bin/stty5.11.pl ]; then
    flag=1
    echo -e "\x1b[1;31mstty5.11.pl"
    sudo mv /usr/local/stty5.11.pl ~/ppappinstaller/
fi

if [[ flag -eq 0 ]]; then
    echo -e "\x1b[1;32mSeems your OS X system isn't infected by the WireLurker.\x1b[0m"
else
    echo -e "\x1b[1;31mClean finished!\x1b[0m"
fi
