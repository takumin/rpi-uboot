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

echo 'CONFIG_BOOTFILE="bcm2708-rpi-b-plus"'   >> "${CONFIG_DIR}/bcm2708_rpi_b_plus_defconfig"
echo 'CONFIG_BOOTFILE="bcm2708-rpi-b-rev1"'   >> "${CONFIG_DIR}/bcm2708_rpi_b_rev1_defconfig"
echo 'CONFIG_BOOTFILE="bcm2708-rpi-b"'        >> "${CONFIG_DIR}/bcm2708_rpi_b_defconfig"
echo 'CONFIG_BOOTFILE="bcm2708-rpi-cm"'       >> "${CONFIG_DIR}/bcm2708_rpi_cm_defconfig"
echo 'CONFIG_BOOTFILE="bcm2708-rpi-zero-w"'   >> "${CONFIG_DIR}/bcm2708_rpi_zero_w_defconfig"
echo 'CONFIG_BOOTFILE="bcm2708-rpi-zero"'     >> "${CONFIG_DIR}/bcm2708_rpi_zero_defconfig"
echo 'CONFIG_BOOTFILE="bcm2709-rpi-2-b"'      >> "${CONFIG_DIR}/bcm2709_rpi_2_b_defconfig"
echo 'CONFIG_BOOTFILE="bcm2710-rpi-2-b"'      >> "${CONFIG_DIR}/bcm2710_rpi_2_b_defconfig"
echo 'CONFIG_BOOTFILE="bcm2710-rpi-3-b-plus"' >> "${CONFIG_DIR}/bcm2710_rpi_3_b_plus_defconfig"
echo 'CONFIG_BOOTFILE="bcm2710-rpi-3-b"'      >> "${CONFIG_DIR}/bcm2710_rpi_3_b_defconfig"
echo 'CONFIG_BOOTFILE="bcm2710-rpi-cm3"'      >> "${CONFIG_DIR}/bcm2710_rpi_cm3_defconfig"
echo 'CONFIG_BOOTFILE="bcm2710-rpi-zero-2-w"' >> "${CONFIG_DIR}/bcm2710_rpi_zero_2_w_defconfig"
echo 'CONFIG_BOOTFILE="bcm2710-rpi-zero-2"'   >> "${CONFIG_DIR}/bcm2710_rpi_zero_2_defconfig"
echo 'CONFIG_BOOTFILE="bcm2711-rpi-4-b"'      >> "${CONFIG_DIR}/bcm2711_rpi_4_b_defconfig"
echo 'CONFIG_BOOTFILE="bcm2711-rpi-400"'      >> "${CONFIG_DIR}/bcm2711_rpi_400_defconfig"
echo 'CONFIG_BOOTFILE="bcm2711-rpi-cm4"'      >> "${CONFIG_DIR}/bcm2711_rpi_cm4_defconfig"

for defconfig in "${CONFIG_DIR}"/*; do
  if grep -Eqs "CONFIG_USE_BOOTFILE=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_USE_BOOTFILE=.*/CONFIG_USE_BOOTFILE=y/' "${defconfig}"
  else
    echo 'CONFIG_USE_BOOTFILE=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BOOTDELAY=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTDELAY=.*/CONFIG_BOOTDELAY=-2/' "${defconfig}"
  else
    echo 'CONFIG_BOOTDELAY=-2' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_CMD_DNS=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_CMD_DNS=.*/CONFIG_CMD_DNS=y/' "${defconfig}"
  else
    echo 'CONFIG_CMD_DNS=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_CMD_SNTP=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_CMD_SNTP=.*/CONFIG_CMD_SNTP=y/' "${defconfig}"
  else
    echo 'CONFIG_CMD_SNTP=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_CMD_LINK_LOCAL=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_CMD_LINK_LOCAL=.*/CONFIG_CMD_LINK_LOCAL=y/' "${defconfig}"
  else
    echo 'CONFIG_CMD_LINK_LOCAL=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BOOTP_SEND_HOSTNAME=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTP_SEND_HOSTNAME=.*/CONFIG_BOOTP_SEND_HOSTNAME=y/' "${defconfig}"
  else
    echo 'CONFIG_BOOTP_SEND_HOSTNAME=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BOOTP_PREFER_SERVERIP=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTP_PREFER_SERVERIP=.*/CONFIG_BOOTP_PREFER_SERVERIP=y/' "${defconfig}"
  else
    echo 'CONFIG_BOOTP_PREFER_SERVERIP=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BOOTP_DNS2=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTP_DNS2=.*/CONFIG_BOOTP_DNS2=y/' "${defconfig}"
  else
    echo 'CONFIG_BOOTP_DNS2=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BOOTP_NISDOMAIN=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTP_NISDOMAIN=.*/CONFIG_BOOTP_NISDOMAIN=y/' "${defconfig}"
  else
    echo 'CONFIG_BOOTP_NISDOMAIN=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BOOTP_NTPSERVER=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTP_NTPSERVER=.*/CONFIG_BOOTP_NTPSERVER=y/' "${defconfig}"
  else
    echo 'CONFIG_BOOTP_NTPSERVER=y' >> "${defconfig}"
  fi

  if grep -Eqs "CONFIG_BOOTP_TIMEOFFSET=.*" "${defconfig}"; then
    sed -i -E 's/CONFIG_BOOTP_TIMEOFFSET=.*/CONFIG_BOOTP_TIMEOFFSET=y/' "${defconfig}"
  else
    echo 'CONFIG_BOOTP_TIMEOFFSET=y' >> "${defconfig}"
  fi
done
