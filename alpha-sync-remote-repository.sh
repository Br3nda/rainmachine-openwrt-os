#!/bin/sh
echo "Syncing alpha packages..."
UPDATE_PATH="/mnt/hall/rainmachine-ar71xx-alpha/"

rm -rf $UPDATE_PATH/packages
cp -a bin/ar71xx/packages $UPDATE_PATH

echo "Adding alpha changelog"
d=$(date +%Y-%m-%d)
dt=$(date)
f="$UPDATE_PATH/packages/Changelog.txt"
l_openwrt=$(git  log rainmachine.. --format=-%s)
l_openwrtfeed=$(git --git-dir ../rainmachine-openwrt-feed/.git log master..next --format=-%s)
l_rainmachine=$(git --git-dir ../rainmachine/.git log master.. --format=-%s )
l_rainmachine_webui=$(git --git-dir ../../rainmachine-ui/.git log master..new-layout --format=-%s | grep -v "Merge pull request" )
echo "Build: $dt" > $f
echo "OpenWRT OS Changes:" >> $f
echo "$l_openwrt" >> $f
echo >> $f 
echo "OpenWRT RainMachine Feed Changes:" >> $f
echo "$l_openwrtfeed" >> $f
echo >> $f
echo "Rainmachine App Changes:" >> $f
echo "$l_rainmachine" >> $f

echo "Rainmachine Web UI Changes:" >> $f
echo "$l_rainmachine_webui" >> $f

