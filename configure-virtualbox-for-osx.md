# Configure VirtualBox for OSX

## From a command prompt

- cd "C:\Program Files\Oracle\VirtualBox\"
- VBoxManage.exe modifyvm "Mojave" --cpuidset 00000001 000106e5 00100800
  0098e3fd bfebfbff
- VBoxManage setextradata "Mojave"
  "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
- VBoxManage setextradata "Mojave"
  "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
- VBoxManage setextradata "Mojave"
  "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
- VBoxManage setextradata "Mojave" "VBoxInternal/Devices/smc/0/Config/DeviceKey"
  "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
- VBoxManage setextradata "Mojave"
  "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

## Screen resolution

- VBoxManage setextradata "High Sierra" VBoxInternal2/EfiGraphicsResolution
  1920x1080

- 1280x720 = HD
- 1920x1080 = FHD
- 2560x1440 = QHD
- 2048x1080 = 2K
- 3840x2160 = 4K
- 5120x2880 = 5K
