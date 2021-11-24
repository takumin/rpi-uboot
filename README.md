# rpi-uboot
Raspberry Pi U-Boot

# Step by Step

## Step1
Please download broadcom firmware from Raspberry Pi Official GitHub Repository.

https://github.com/raspberrypi/firmware

File List

- [boot/bootcode.bin](https://github.com/raspberrypi/firmware/raw/master/boot/bootcode.bin "boot/bootcode.bin")
- [boot/start.elf](https://github.com/raspberrypi/firmware/raw/master/boot/start.elf "boot/start.elf")
- [boot/start_cd.elf](https://github.com/raspberrypi/firmware/raw/master/boot/start_cd.elf "boot/start_cd.elf")
- [boot/start_db.elf](https://github.com/raspberrypi/firmware/raw/master/boot/start_db.elf "boot/start_db.elf")
- [boot/start_x.elf](https://github.com/raspberrypi/firmware/raw/master/boot/start_x.elf "boot/start_x.elf")
- [boot/start4.elf](https://github.com/raspberrypi/firmware/raw/master/boot/start4.elf "boot/start4.elf")
- [boot/start4cd.elf](https://github.com/raspberrypi/firmware/raw/master/boot/start4cd.elf "boot/start4cd.elf")
- [boot/start4db.elf](https://github.com/raspberrypi/firmware/raw/master/boot/start4db.elf "boot/start4db.elf")
- [boot/start4x.elf](https://github.com/raspberrypi/firmware/raw/master/boot/start4x.elf "boot/start4x.elf")
- [boot/fixup.dat](https://github.com/raspberrypi/firmware/raw/master/boot/fixup.dat "boot/fixup.dat")
- [boot/fixup_cd.dat](https://github.com/raspberrypi/firmware/raw/master/boot/fixup_cd.dat "boot/fixup_cd.dat")
- [boot/fixup_db.dat](https://github.com/raspberrypi/firmware/raw/master/boot/fixup_db.dat "boot/fixup_db.dat")
- [boot/fixup_x.dat](https://github.com/raspberrypi/firmware/raw/master/boot/fixup_x.dat "boot/fixup_x.dat")
- [boot/fixup4.dat](https://github.com/raspberrypi/firmware/raw/master/boot/fixup4.dat "boot/fixup4.dat")
- [boot/fixup4cd.dat](https://github.com/raspberrypi/firmware/raw/master/boot/fixup4cd.dat "boot/fixup4cd.dat")
- [boot/fixup4db.dat](https://github.com/raspberrypi/firmware/raw/master/boot/fixup4db.dat "boot/fixup4db.dat")
- [boot/fixup4x.dat](https://github.com/raspberrypi/firmware/raw/master/boot/fixup4x.dat "boot/fixup4x.dat")

## Step2
Please copy downloaded files to FAT file system root directory.

## Step3
Please download U-Boot binary from release page.

## Step4
Please create a file with the following contents.

```
# Raspberry Pi 1A 32Bit
[board-type=0x00]
kernel=u-boot-bcm2708-rpi-b.bin

# Raspberry Pi 1A+ 32Bit
[board-type=0x02]
kernel=u-boot-bcm2708-rpi-b.bin

# Raspberry Pi 1B 32Bit
[board-type=0x01]
kernel=u-boot-bcm2708-rpi-b.bin

# Raspberry Pi 1B+ 32Bit
[board-type=0x03]
kernel=u-boot-bcm2708-rpi-b-plus.bin

# Raspberry Pi 2B 32Bit
[board-type=0x04]
kernel=u-boot-bcm2709-rpi-2-b.bin

# Raspberry Pi CM1 32Bit
[board-type=0x06]
kernel=u-boot-bcm2708-rpi-cm.bin

# Raspberry Pi Zero 32Bit
[board-type=0x09]
kernel=u-boot-bcm2708-rpi-zero.bin

# Raspberry Pi Zero W 32Bit
[board-type=0x0c]
kernel=u-boot-bcm2708-rpi-zero-w.bin

# Raspberry Pi 3A+ 64Bit
[board-type=0x0e]
arm_64bit=1
kernel=u-boot-bcm2710-rpi-3-b-plus.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# Raspberry Pi 3B 64Bit
[board-type=0x08]
arm_64bit=1
kernel=u-boot-bcm2710-rpi-3-b.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# Raspberry Pi 3B+ 64Bit
[board-type=0x0d]
arm_64bit=1
kernel=u-boot-bcm2710-rpi-3-b-plus.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# Raspberry Pi CM3 64Bit
[board-type=0x0a]
arm_64bit=1
kernel=u-boot-bcm2710-rpi-cm3.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# Raspberry Pi CM3+ 64Bit
[board-type=0x10]
arm_64bit=1
kernel=u-boot-bcm2710-rpi-cm3.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# Raspberry Pi 4B 64Bit
[board-type=0x11]
arm_64bit=1
kernel=u-boot-bcm2711-rpi-4-b.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# Raspberry Pi Zero 2 W 64Bit
[board-type=0x12]
arm_64bit=1
kernel=u-boot-bcm2710-rpi-zero-2-w.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# Raspberry Pi 400 64Bit
[board-type=0x13]
arm_64bit=1
kernel=u-boot-bcm2711-rpi-400.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# Raspberry Pi CM4 64Bit
[board-type=0x14]
arm_64bit=1
kernel=u-boot-bcm2711-rpi-cm4.bin
dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d

# All Raspberry Pi
[all]
force_turbo=1
dtparam=watchdog=on
```

## Final
Boot! ;-)
