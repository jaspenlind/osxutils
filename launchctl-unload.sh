#!/bin/bash
# Remove unwanted launch agents
#system=/System/Library/LaunchDaemons/
thirdparty=/Library/LaunchDaemons/
user=/Library/LaunchAgents/
#user1=/System/Library/LaunchAgents/
#user2=~/Library/LaunchAgents/

thirdpartycrap=(org.wireshark.ChmodBPF.plist
  com.microsoft.OneDriveStandaloneUpdaterDaemon.plist
  com.microsoft.OneDriveUpdaterDaemon.plist
  com.spitfireaudio.LibraryManagerHelper.plist
  com.oracle.java.Helper-Tool.plist
  com.teamviewer.Helper.plist
  com.teamviewer.teamviewer_service.plist
  com.microsoft.teams.TeamsUpdaterDaemon.plist
  com.microsoft.office.licensingV2.helper.plist
  com.microsoft.autoupdate.helper.plist
  com.prosofteng.DRInstaller.plist
  com.gobbler.bsd.HelperTool.plist
  com.docker.vmnetd.plist
  com.citrix.ctxusbd.plist
  com.akaiprofessional.mpcone.launchdaemon.plist
  com.airo.uninstall.helper.plist
  com.Arturia.InstallHelper.plist
  com.soma-zone.LaunchControl.Helper.plist
  com.nordvpn.osx.helper.plist)

usercrap=(com.Arturia.ArturiaSoftwareCenterAgent.plist
  com.microsoft.OneDriveStandaloneUpdater.plist
  com.airo.a.plist
  com.microsoft.update.agent.plist
  com.teamviewer.teamviewer.plist
  com.teamviewer.teamviewer_desktop.plist)

unload() {
  local location="$1"
  shift
  local crap=("$@")

  for i in "${crap[@]}"; do
    :
    current="$location$i"

    if test -f "$current"; then
      local launchctl="launchctl unload -w $current"
      echo "Processing $current"
      if [[ "$location" = *LaunchDaemons* ]]; then
        launchctl="sudo $launchctl"
      fi

      result=$(bash -c "$launchctl" 2>&1)

      if [[ "$result" != *"Unload failed"* ]]; then
        sudo mv "$current" "$current.bak"
        echo "Sucessfully unloaded $current"
      else
        echo "Failed to unload $current"
        echo "$result"
      fi
    fi
  done
}
echo "Unloading thirdparty agents"
unload "$thirdparty" "${thirdpartycrap[@]}"
echo "Unloading user agents"
unload "$user" "${usercrap[@]}"
echo "Done"
