#!/bin/sh

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.."; pwd)"
SOURCE_DIR="$(cd "${PROJECT_DIR}/u-boot"; pwd)"
CONFIG_DIR="$(cd "${PROJECT_DIR}/configs"; pwd)"

cp "${SOURCE_DIR}/configs/rpi_defconfig"   "${CONFIG_DIR}/bcm2708_rpi_b_plus_defconfig"
cp "${SOURCE_DIR}/configs/rpi_defconfig"   "${CONFIG_DIR}/bcm2708_rpi_b_rev1_defconfig"
cp "${SOURCE_DIR}/configs/rpi_defconfig"   "${CONFIG_DIR}/bcm2708_rpi_b_defconfig"
cp "${SOURCE_DIR}/configs/rpi_defconfig"   "${CONFIG_DIR}/bcm2708_rpi_cm_defconfig"
cp "${SOURCE_DIR}/configs/rpi_defconfig"   "${CONFIG_DIR}/bcm2708_rpi_zero_w_defconfig"
cp "${SOURCE_DIR}/configs/rpi_defconfig"   "${CONFIG_DIR}/bcm2708_rpi_zero_defconfig"
cp "${SOURCE_DIR}/configs/rpi_2_defconfig" "${CONFIG_DIR}/bcm2709_rpi_2_b_defconfig"
cp "${SOURCE_DIR}/configs/rpi_2_defconfig" "${CONFIG_DIR}/bcm2710_rpi_2_b_defconfig"
cp "${SOURCE_DIR}/configs/rpi_3_defconfig" "${CONFIG_DIR}/bcm2710_rpi_3_b_plus_defconfig"
cp "${SOURCE_DIR}/configs/rpi_3_defconfig" "${CONFIG_DIR}/bcm2710_rpi_3_b_defconfig"
cp "${SOURCE_DIR}/configs/rpi_3_defconfig" "${CONFIG_DIR}/bcm2710_rpi_cm3_defconfig"
cp "${SOURCE_DIR}/configs/rpi_3_defconfig" "${CONFIG_DIR}/bcm2710_rpi_zero_2_w_defconfig"
cp "${SOURCE_DIR}/configs/rpi_3_defconfig" "${CONFIG_DIR}/bcm2710_rpi_zero_2_defconfig"
cp "${SOURCE_DIR}/configs/rpi_4_defconfig" "${CONFIG_DIR}/bcm2711_rpi_4_b_defconfig"
cp "${SOURCE_DIR}/configs/rpi_4_defconfig" "${CONFIG_DIR}/bcm2711_rpi_400_defconfig"
cp "${SOURCE_DIR}/configs/rpi_4_defconfig" "${CONFIG_DIR}/bcm2711_rpi_cm4_defconfig"

echo 'CONFIG_DEFAULT_FDT_FILE="bcm2708-rpi-b-plus.dtb"'   >> "${CONFIG_DIR}/bcm2708_rpi_b_plus_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2708-rpi-b-rev1.dtb"'   >> "${CONFIG_DIR}/bcm2708_rpi_b_rev1_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2708-rpi-b.dtb"'        >> "${CONFIG_DIR}/bcm2708_rpi_b_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2708-rpi-cm.dtb"'       >> "${CONFIG_DIR}/bcm2708_rpi_cm_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2708-rpi-zero-w.dtb"'   >> "${CONFIG_DIR}/bcm2708_rpi_zero_w_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2708-rpi-zero.dtb"'     >> "${CONFIG_DIR}/bcm2708_rpi_zero_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2709-rpi-2-b.dtb"'      >> "${CONFIG_DIR}/bcm2709_rpi_2_b_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2710-rpi-2-b.dtb"'      >> "${CONFIG_DIR}/bcm2710_rpi_2_b_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2710-rpi-3-b-plus.dtb"' >> "${CONFIG_DIR}/bcm2710_rpi_3_b_plus_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2710-rpi-3-b.dtb"'      >> "${CONFIG_DIR}/bcm2710_rpi_3_b_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2710-rpi-cm3.dtb"'      >> "${CONFIG_DIR}/bcm2710_rpi_cm3_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2710-rpi-zero-2-w.dtb"' >> "${CONFIG_DIR}/bcm2710_rpi_zero_2_w_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2710-rpi-zero-2.dtb"'   >> "${CONFIG_DIR}/bcm2710_rpi_zero_2_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2711-rpi-4-b.dtb"'      >> "${CONFIG_DIR}/bcm2711_rpi_4_b_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2711-rpi-400.dtb"'      >> "${CONFIG_DIR}/bcm2711_rpi_400_defconfig"
echo 'CONFIG_DEFAULT_FDT_FILE="bcm2711-rpi-cm4.dtb"'      >> "${CONFIG_DIR}/bcm2711_rpi_cm4_defconfig"

for defconfig in "${CONFIG_DIR}"/*; do
  if grep -Eqs "CONFIG_BOOTCOMMAND=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTCOMMAND=.*/CONFIG_BOOTCOMMAND="run bootcmd_dhcp"/' "${defconfig}"
  else
    echo 'CONFIG_BOOTCOMMAND="run bootcmd_dhcp"' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BOOTDELAY=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTDELAY=.*/CONFIG_BOOTDELAY=0/' "${defconfig}"
  else
    echo 'CONFIG_BOOTDELAY=0' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_CMD_BOOTEFI=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_CMD_BOOTEFI=.*/CONFIG_CMD_BOOTEFI=y/' "${defconfig}"
  else
    echo 'CONFIG_CMD_BOOTEFI=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_EFI_LOADER=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_EFI_LOADER=.*/CONFIG_EFI_LOADER=y/' "${defconfig}"
  else
    echo 'CONFIG_EFI_LOADER=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BLK=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BLK=.*/CONFIG_BLK=y/' "${defconfig}"
  else
    echo 'CONFIG_BLK=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_PARTITIONS=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_PARTITIONS=.*/CONFIG_PARTITIONS=y/' "${defconfig}"
  else
    echo 'CONFIG_PARTITIONS=y' >> "${defconfig}"
  fi
done
