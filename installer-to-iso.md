# Create OSX installer ISO

1. Download "Install MacOS mojave" from app store
2. Open a terminal and run the following commands to:
   - create a disk image
   - mount the image
   - restore the installer to the image
   - converting the image to ISO format

- hdiutil create -o /tmp/Mojave.cdr -size 7316m -layout SPUD -fs HFS+J
- hdiutil attach /tmp/Mojave.cdr.dmg -noverify -nobrowse -mountpoint
  /Volumes/install
- asr restore -source /Applications/Install\ macOS\
  Mojave.app/Contents/SharedSupport/BaseSystem.dmg -target /Volumes/install
  -noprompt -noverify -erase
- hdiutil detach /Volumes/OS\ X\ Base\ System
- hdiutil convert /tmp/Mojave.cdr.dmg -format UDTO -o /tmp/Mojave.iso
- mv /tmp/Mojave.iso.cdr /tmp/Mojave.iso
