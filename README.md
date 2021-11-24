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
# Enable GPIO UART
#enable_uart=1

# Raspberry Pi 1 Model A/A+/B/B+
#kernel=rpi1_uboot.bin

# Raspberry Pi 2 Model B
#kernel=rpi2_uboot.bin

# Raspberry Pi 3 Model B (32bit)
#kernel=rpi3_32_uboot.bin

# Raspberry Pi 3 Model B (64bit)
#arm_64bit=1
#kernel=rpi3_64_uboot.bin
```

## Final
Boot! ;-)
