# Create OSX installer ISO

```bash
hdiutil create -o /tmp/Mojave.cdr -size 7316m -layout SPUD -fs HFS+J
hdiutil attach /tmp/Mojave.cdr.dmg -noverify -nobrowse -mountpoint /Volumes/install
asr restore -source /Applications/Install\ macOS\ Mojave.app/Contents/SharedSupport/BaseSystem.dmg \ 
-target /Volumes/install -noprompt -noverify -erase
hdiutil detach /Volumes/OS\ X\ Base\ System
hdiutil convert /tmp/Mojave.cdr.dmg -format UDTO -o /tmp/Mojave.iso
-mv /tmp/Mojave.iso.cdr /tmp/Mojave.iso
```
