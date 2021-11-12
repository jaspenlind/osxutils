# OSX Utils

## Unload unwanted launch agents and daemons

`./launchctl-unload.sh`

## List open files

`sudo lsof | grep nsurl`

## List running processes

`ps -ef|grep nsurl`

## List file activity

`sudo fs_usage -w | grep nsurl`

## iCloud sync activity

`brctl log -w -s`
