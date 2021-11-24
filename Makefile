################################################################################
# Release Infomation Variables
################################################################################

RELEASE_DATE  := $(shell date "+%Y%m%d")
RELEASE_NOTES := Release: v$(RELEASE_DATE)

################################################################################
# Cross Compiler Prefix Variables
################################################################################

ARM32_CROSS_COMPILE ?= arm-linux-gnueabihf-
ARM64_CROSS_COMPILE ?= aarch64-linux-gnu-

################################################################################
# Parallel Build Number Variable
################################################################################

PARALLEL ?= $(shell expr $(shell nproc) + 2)

################################################################################
# Source Code Directory Variable
################################################################################

SOURCE_DIR ?= $(abspath $(CURDIR)/u-boot)

################################################################################
# Config Directory Variable
################################################################################

CONFIG_DIR ?= $(abspath $(CURDIR)/configs)

################################################################################
# Top Build Directory Variable
################################################################################

BUILD_DIR ?= /tmp/rpi-uboot-build

################################################################################
# Distribution Directory Variable
################################################################################

DIST_DIR ?= /tmp/rpi-uboot-dist

################################################################################
# Build Target Variables
################################################################################

TARGETS := u-boot-bcm2708-rpi-b-plus.bin
TARGETS += u-boot-bcm2708-rpi-b-rev1.bin
TARGETS += u-boot-bcm2708-rpi-b.bin
TARGETS += u-boot-bcm2708-rpi-cm.bin
TARGETS += u-boot-bcm2708-rpi-zero-w.bin
TARGETS += u-boot-bcm2708-rpi-zero.bin
TARGETS += u-boot-bcm2709-rpi-2-b.bin
TARGETS += u-boot-bcm2710-rpi-2-b.bin
TARGETS += u-boot-bcm2710-rpi-3-b-plus.bin
TARGETS += u-boot-bcm2710-rpi-3-b.bin
TARGETS += u-boot-bcm2710-rpi-cm3.bin
TARGETS += u-boot-bcm2710-rpi-zero-2-w.bin
TARGETS += u-boot-bcm2710-rpi-zero-2.bin
TARGETS += u-boot-bcm2711-rpi-4-b.bin
TARGETS += u-boot-bcm2711-rpi-400.bin
TARGETS += u-boot-bcm2711-rpi-cm4.bin

################################################################################
# Build Directory Variables
################################################################################

BCM2708_RPI_B_PLUS_DIR   := $(abspath $(BUILD_DIR)/bcm2708_rpi_b_plus)
BCM2708_RPI_B_REV1_DIR   := $(abspath $(BUILD_DIR)/bcm2708_rpi_b_rev1)
BCM2708_RPI_B_DIR        := $(abspath $(BUILD_DIR)/bcm2708_rpi_b)
BCM2708_RPI_CM_DIR       := $(abspath $(BUILD_DIR)/bcm2708_rpi_cm)
BCM2708_RPI_ZERO_W_DIR   := $(abspath $(BUILD_DIR)/bcm2708_rpi_zero_w)
BCM2708_RPI_ZERO_DIR     := $(abspath $(BUILD_DIR)/bcm2708_rpi_zero)
BCM2709_RPI_2_B_DIR      := $(abspath $(BUILD_DIR)/bcm2709_rpi_2_b)
BCM2710_RPI_2_B_DIR      := $(abspath $(BUILD_DIR)/bcm2710_rpi_2_b)
BCM2710_RPI_3_B_PLUS_DIR := $(abspath $(BUILD_DIR)/bcm2710_rpi_3_b_plus)
BCM2710_RPI_3_B_DIR      := $(abspath $(BUILD_DIR)/bcm2710_rpi_3_b)
BCM2710_RPI_CM3_DIR      := $(abspath $(BUILD_DIR)/bcm2710_rpi_cm3)
BCM2710_RPI_ZERO_2_W_DIR := $(abspath $(BUILD_DIR)/bcm2710_rpi_zero_2_w)
BCM2710_RPI_ZERO_2_DIR   := $(abspath $(BUILD_DIR)/bcm2710_rpi_zero_2)
BCM2711_RPI_4_B_DIR      := $(abspath $(BUILD_DIR)/bcm2711_rpi_4_b)
BCM2711_RPI_400_DIR      := $(abspath $(BUILD_DIR)/bcm2711_rpi_400)
BCM2711_RPI_CM4_DIR      := $(abspath $(BUILD_DIR)/bcm2711_rpi_cm4)

################################################################################
# Default Config Variables
################################################################################

BCM2708_RPI_B_PLUS_DEFCONFIG   := $(abspath $(CONFIG_DIR)/bcm2708_rpi_b_plus_defconfig)
BCM2708_RPI_B_REV1_DEFCONFIG   := $(abspath $(CONFIG_DIR)/bcm2708_rpi_b_rev1_defconfig)
BCM2708_RPI_B_DEFCONFIG        := $(abspath $(CONFIG_DIR)/bcm2708_rpi_b_defconfig)
BCM2708_RPI_CM_DEFCONFIG       := $(abspath $(CONFIG_DIR)/bcm2708_rpi_cm_defconfig)
BCM2708_RPI_ZERO_W_DEFCONFIG   := $(abspath $(CONFIG_DIR)/bcm2708_rpi_zero_w_defconfig)
BCM2708_RPI_ZERO_DEFCONFIG     := $(abspath $(CONFIG_DIR)/bcm2708_rpi_zero_defconfig)
BCM2709_RPI_2_B_DEFCONFIG      := $(abspath $(CONFIG_DIR)/bcm2709_rpi_2_b_defconfig)
BCM2710_RPI_2_B_DEFCONFIG      := $(abspath $(CONFIG_DIR)/bcm2710_rpi_2_b_defconfig)
BCM2710_RPI_3_B_PLUS_DEFCONFIG := $(abspath $(CONFIG_DIR)/bcm2710_rpi_3_b_plus_defconfig)
BCM2710_RPI_3_B_DEFCONFIG      := $(abspath $(CONFIG_DIR)/bcm2710_rpi_3_b_defconfig)
BCM2710_RPI_CM3_DEFCONFIG      := $(abspath $(CONFIG_DIR)/bcm2710_rpi_cm3_defconfig)
BCM2710_RPI_ZERO_2_W_DEFCONFIG := $(abspath $(CONFIG_DIR)/bcm2710_rpi_zero_2_w_defconfig)
BCM2710_RPI_ZERO_2_DEFCONFIG   := $(abspath $(CONFIG_DIR)/bcm2710_rpi_zero_2_defconfig)
BCM2711_RPI_4_B_DEFCONFIG      := $(abspath $(CONFIG_DIR)/bcm2711_rpi_4_b_defconfig)
BCM2711_RPI_400_DEFCONFIG      := $(abspath $(CONFIG_DIR)/bcm2711_rpi_400_defconfig)
BCM2711_RPI_CM4_DEFCONFIG      := $(abspath $(CONFIG_DIR)/bcm2711_rpi_cm4_defconfig)

################################################################################
# Macro
################################################################################

define DEFCONFIG
	@cp "$2" "$(@D)/.config"
	@cp "$2" "$(SOURCE_DIR)/configs/$(@F)"
	@$(MAKE) \
		-C "$(SOURCE_DIR)" \
		-j "$(PARALLEL)" \
		O="$(@D)" \
		CROSS_COMPILE="$1" \
		olddefconfig
	@rm "$(SOURCE_DIR)/configs/$(@F)"
endef

define BUILD
	@$(MAKE) \
		-C "$(SOURCE_DIR)" \
		-j "$(PARALLEL)" \
		O="$(@D)" \
		CROSS_COMPILE="$1" \
		all
endef

define INSTALL
	@install -C -m 0644 "$^" "$@"
endef

################################################################################
# Default Target
################################################################################

.PHONY: default
default: show

################################################################################
# Build Target
################################################################################

.PHONY: build
build: $(TARGETS)

################################################################################
# Build Directory Targets
################################################################################

$(BUILD_DIR):
	@mkdir -p $@
$(BCM2708_RPI_B_PLUS_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2708_RPI_B_REV1_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2708_RPI_B_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2708_RPI_CM_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2708_RPI_ZERO_W_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2708_RPI_ZERO_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2709_RPI_2_B_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2710_RPI_2_B_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2710_RPI_3_B_PLUS_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2710_RPI_3_B_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2710_RPI_CM3_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2710_RPI_ZERO_2_W_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2710_RPI_ZERO_2_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2711_RPI_4_B_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2711_RPI_400_DIR): $(BUILD_DIR)
	@mkdir -p "$@"
$(BCM2711_RPI_CM4_DIR): $(BUILD_DIR)
	@mkdir -p "$@"

################################################################################
# Default Config Targets
################################################################################

$(BCM2708_RPI_B_PLUS_DIR)/.config: $(BCM2708_RPI_B_PLUS_DIR)
	$(call DEFCONFIG,$(ARM32_CROSS_COMPILE),$(BCM2708_RPI_B_PLUS_DEFCONFIG))
$(BCM2708_RPI_B_REV1_DIR)/.config: $(BCM2708_RPI_B_REV1_DIR)
	$(call DEFCONFIG,$(ARM32_CROSS_COMPILE),$(BCM2708_RPI_B_REV1_DEFCONFIG))
$(BCM2708_RPI_B_DIR)/.config: $(BCM2708_RPI_B_DIR)
	$(call DEFCONFIG,$(ARM32_CROSS_COMPILE),$(BCM2708_RPI_B_DEFCONFIG))
$(BCM2708_RPI_CM_DIR)/.config: $(BCM2708_RPI_CM_DIR)
	$(call DEFCONFIG,$(ARM32_CROSS_COMPILE),$(BCM2708_RPI_CM_DEFCONFIG))
$(BCM2708_RPI_ZERO_W_DIR)/.config: $(BCM2708_RPI_ZERO_W_DIR)
	$(call DEFCONFIG,$(ARM32_CROSS_COMPILE),$(BCM2708_RPI_ZERO_W_DEFCONFIG))
$(BCM2708_RPI_ZERO_DIR)/.config: $(BCM2708_RPI_ZERO_DIR)
	$(call DEFCONFIG,$(ARM32_CROSS_COMPILE),$(BCM2708_RPI_ZERO_DEFCONFIG))
$(BCM2709_RPI_2_B_DIR)/.config: $(BCM2709_RPI_2_B_DIR)
	$(call DEFCONFIG,$(ARM32_CROSS_COMPILE),$(BCM2709_RPI_2_B_DEFCONFIG))
$(BCM2710_RPI_2_B_DIR)/.config: $(BCM2710_RPI_2_B_DIR)
	$(call DEFCONFIG,$(ARM32_CROSS_COMPILE),$(BCM2710_RPI_2_B_DEFCONFIG))
$(BCM2710_RPI_3_B_PLUS_DIR)/.config: $(BCM2710_RPI_3_B_PLUS_DIR)
	$(call DEFCONFIG,$(ARM64_CROSS_COMPILE),$(BCM2710_RPI_3_B_PLUS_DEFCONFIG))
$(BCM2710_RPI_3_B_DIR)/.config: $(BCM2710_RPI_3_B_DIR)
	$(call DEFCONFIG,$(ARM64_CROSS_COMPILE),$(BCM2710_RPI_3_B_DEFCONFIG))
$(BCM2710_RPI_CM3_DIR)/.config: $(BCM2710_RPI_CM3_DIR)
	$(call DEFCONFIG,$(ARM64_CROSS_COMPILE),$(BCM2710_RPI_CM3_DEFCONFIG))
$(BCM2710_RPI_ZERO_2_W_DIR)/.config: $(BCM2710_RPI_ZERO_2_W_DIR)
	$(call DEFCONFIG,$(ARM64_CROSS_COMPILE),$(BCM2710_RPI_ZERO_2_W_DEFCONFIG))
$(BCM2710_RPI_ZERO_2_DIR)/.config: $(BCM2710_RPI_ZERO_2_DIR)
	$(call DEFCONFIG,$(ARM64_CROSS_COMPILE),$(BCM2710_RPI_ZERO_2_DEFCONFIG))
$(BCM2711_RPI_4_B_DIR)/.config: $(BCM2711_RPI_4_B_DIR)
	$(call DEFCONFIG,$(ARM64_CROSS_COMPILE),$(BCM2711_RPI_4_B_DEFCONFIG))
$(BCM2711_RPI_400_DIR)/.config: $(BCM2711_RPI_400_DIR)
	$(call DEFCONFIG,$(ARM64_CROSS_COMPILE),$(BCM2711_RPI_400_DEFCONFIG))
$(BCM2711_RPI_CM4_DIR)/.config: $(BCM2711_RPI_CM4_DIR)
	$(call DEFCONFIG,$(ARM64_CROSS_COMPILE),$(BCM2711_RPI_CM4_DEFCONFIG))

################################################################################
# Build Binary Targets
################################################################################

$(BCM2708_RPI_B_PLUS_DIR)/u-boot.bin: $(BCM2708_RPI_B_PLUS_DIR)/.config
	$(call BUILD,$(ARM32_CROSS_COMPILE))
$(BCM2708_RPI_B_REV1_DIR)/u-boot.bin: $(BCM2708_RPI_B_REV1_DIR)/.config
	$(call BUILD,$(ARM32_CROSS_COMPILE))
$(BCM2708_RPI_B_DIR)/u-boot.bin: $(BCM2708_RPI_B_DIR)/.config
	$(call BUILD,$(ARM32_CROSS_COMPILE))
$(BCM2708_RPI_CM_DIR)/u-boot.bin: $(BCM2708_RPI_CM_DIR)/.config
	$(call BUILD,$(ARM32_CROSS_COMPILE))
$(BCM2708_RPI_ZERO_W_DIR)/u-boot.bin: $(BCM2708_RPI_ZERO_W_DIR)/.config
	$(call BUILD,$(ARM32_CROSS_COMPILE))
$(BCM2708_RPI_ZERO_DIR)/u-boot.bin: $(BCM2708_RPI_ZERO_DIR)/.config
	$(call BUILD,$(ARM32_CROSS_COMPILE))
$(BCM2709_RPI_2_B_DIR)/u-boot.bin: $(BCM2709_RPI_2_B_DIR)/.config
	$(call BUILD,$(ARM32_CROSS_COMPILE))
$(BCM2710_RPI_2_B_DIR)/u-boot.bin: $(BCM2710_RPI_2_B_DIR)/.config
	$(call BUILD,$(ARM32_CROSS_COMPILE))
$(BCM2710_RPI_3_B_PLUS_DIR)/u-boot.bin: $(BCM2710_RPI_3_B_PLUS_DIR)/.config
	$(call BUILD,$(ARM64_CROSS_COMPILE))
$(BCM2710_RPI_3_B_DIR)/u-boot.bin: $(BCM2710_RPI_3_B_DIR)/.config
	$(call BUILD,$(ARM64_CROSS_COMPILE))
$(BCM2710_RPI_CM3_DIR)/u-boot.bin: $(BCM2710_RPI_CM3_DIR)/.config
	$(call BUILD,$(ARM64_CROSS_COMPILE))
$(BCM2710_RPI_ZERO_2_W_DIR)/u-boot.bin: $(BCM2710_RPI_ZERO_2_W_DIR)/.config
	$(call BUILD,$(ARM64_CROSS_COMPILE))
$(BCM2710_RPI_ZERO_2_DIR)/u-boot.bin: $(BCM2710_RPI_ZERO_2_DIR)/.config
	$(call BUILD,$(ARM64_CROSS_COMPILE))
$(BCM2711_RPI_4_B_DIR)/u-boot.bin: $(BCM2711_RPI_4_B_DIR)/.config
	$(call BUILD,$(ARM64_CROSS_COMPILE))
$(BCM2711_RPI_400_DIR)/u-boot.bin: $(BCM2711_RPI_400_DIR)/.config
	$(call BUILD,$(ARM64_CROSS_COMPILE))
$(BCM2711_RPI_CM4_DIR)/u-boot.bin: $(BCM2711_RPI_CM4_DIR)/.config
	$(call BUILD,$(ARM64_CROSS_COMPILE))

################################################################################
# Distribution File Targets
################################################################################

$(DIST_DIR):
	@mkdir -p "$@"

.PHONY: u-boot-bcm2708-rpi-b-plus.bin
u-boot-bcm2708-rpi-b-plus.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2708-rpi-b-plus.bin
$(DIST_DIR)/u-boot-bcm2708-rpi-b-plus.bin: $(BCM2708_RPI_B_PLUS_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2708-rpi-b-rev1.bin
u-boot-bcm2708-rpi-b-rev1.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2708-rpi-b-rev1.bin
$(DIST_DIR)/u-boot-bcm2708-rpi-b-rev1.bin: $(BCM2708_RPI_B_REV1_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2708-rpi-b.bin
u-boot-bcm2708-rpi-b.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2708-rpi-b.bin
$(DIST_DIR)/u-boot-bcm2708-rpi-b.bin: $(BCM2708_RPI_B_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2708-rpi-cm.bin
u-boot-bcm2708-rpi-cm.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2708-rpi-cm.bin
$(DIST_DIR)/u-boot-bcm2708-rpi-cm.bin: $(BCM2708_RPI_CM_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2708-rpi-zero-w.bin
u-boot-bcm2708-rpi-zero-w.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2708-rpi-zero-w.bin
$(DIST_DIR)/u-boot-bcm2708-rpi-zero-w.bin: $(BCM2708_RPI_ZERO_W_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2708-rpi-zero.bin
u-boot-bcm2708-rpi-zero.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2708-rpi-zero.bin
$(DIST_DIR)/u-boot-bcm2708-rpi-zero.bin: $(BCM2708_RPI_ZERO_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2709-rpi-2-b.bin
u-boot-bcm2709-rpi-2-b.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2709-rpi-2-b.bin
$(DIST_DIR)/u-boot-bcm2709-rpi-2-b.bin: $(BCM2709_RPI_2_B_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2710-rpi-2-b.bin
u-boot-bcm2710-rpi-2-b.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2710-rpi-2-b.bin
$(DIST_DIR)/u-boot-bcm2710-rpi-2-b.bin: $(BCM2710_RPI_2_B_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2710-rpi-3-b-plus.bin
u-boot-bcm2710-rpi-3-b-plus.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2710-rpi-3-b-plus.bin
$(DIST_DIR)/u-boot-bcm2710-rpi-3-b-plus.bin: $(BCM2710_RPI_3_B_PLUS_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2710-rpi-3-b.bin
u-boot-bcm2710-rpi-3-b.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2710-rpi-3-b.bin
$(DIST_DIR)/u-boot-bcm2710-rpi-3-b.bin: $(BCM2710_RPI_3_B_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2710-rpi-cm3.bin
u-boot-bcm2710-rpi-cm3.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2710-rpi-cm3.bin
$(DIST_DIR)/u-boot-bcm2710-rpi-cm3.bin: $(BCM2710_RPI_CM3_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2710-rpi-zero-2-w.bin
u-boot-bcm2710-rpi-zero-2-w.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2710-rpi-zero-2-w.bin
$(DIST_DIR)/u-boot-bcm2710-rpi-zero-2-w.bin: $(BCM2710_RPI_ZERO_2_W_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2710-rpi-zero-2.bin
u-boot-bcm2710-rpi-zero-2.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2710-rpi-zero-2.bin
$(DIST_DIR)/u-boot-bcm2710-rpi-zero-2.bin: $(BCM2710_RPI_ZERO_2_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2711-rpi-4-b.bin
u-boot-bcm2711-rpi-4-b.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2711-rpi-4-b.bin
$(DIST_DIR)/u-boot-bcm2711-rpi-4-b.bin: $(BCM2711_RPI_4_B_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2711-rpi-400.bin
u-boot-bcm2711-rpi-400.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2711-rpi-400.bin
$(DIST_DIR)/u-boot-bcm2711-rpi-400.bin: $(BCM2711_RPI_400_DIR)/u-boot.bin
	$(INSTALL)
.PHONY: u-boot-bcm2711-rpi-cm4.bin
u-boot-bcm2711-rpi-cm4.bin: $(DIST_DIR) $(DIST_DIR)/u-boot-bcm2711-rpi-cm4.bin
$(DIST_DIR)/u-boot-bcm2711-rpi-cm4.bin: $(BCM2711_RPI_CM4_DIR)/u-boot.bin
	$(INSTALL)

################################################################################
# Caluculate Checksum Target
################################################################################

.PHONY: checksum
checksum: MD5SUMS SHA1SUMS SHA256SUMS SHA512SUMS

.PHONY: MD5SUMS
MD5SUMS: $(DIST_DIR)/MD5SUMS
$(DIST_DIR)/MD5SUMS: $(TARGETS)
	@cd "$(DIST_DIR)" && md5sum $^ | tee $@ > /dev/null

.PHONY: SHA1SUMS
SHA1SUMS: $(DIST_DIR)/SHA1SUMS
$(DIST_DIR)/SHA1SUMS: $(TARGETS)
	@cd "$(DIST_DIR)" && sha1sum $^ | tee $@ > /dev/null

.PHONY: SHA256SUMS
SHA256SUMS: $(DIST_DIR)/SHA256SUMS
$(DIST_DIR)/SHA256SUMS: $(TARGETS)
	@cd "$(DIST_DIR)" && sha256sum $^ | tee $@ > /dev/null

.PHONY: SHA512SUMS
SHA512SUMS: $(DIST_DIR)/SHA512SUMS
$(DIST_DIR)/SHA512SUMS: $(TARGETS)
	@cd "$(DIST_DIR)" && sha512sum $^ | tee $@ > /dev/null

################################################################################
# Build Infomation Target
################################################################################

.PHONY: show
show: MD5SUMS SHA1SUMS SHA256SUMS SHA512SUMS
	@echo "MD5SUMS"
	@cat $(DIST_DIR)/MD5SUMS
	@echo
	@echo "SHA1SUMS"
	@cat $(DIST_DIR)/SHA1SUMS
	@echo
	@echo "SHA256SUMS"
	@cat $(DIST_DIR)/SHA256SUMS
	@echo
	@echo "SHA512SUMS"
	@cat $(DIST_DIR)/SHA512SUMS

################################################################################
# Release Target
################################################################################

.PHONY: release
release: build checksum
	@gh auth status 1>/dev/null 2>&1 || exit 1
	@gh release create "v$(RELEASE_DATE)" -n "$(RELEASE_NOTES)" $(DIST_DIR)/*

################################################################################
# Cleanup Target
################################################################################

.PHONY: clean
clean:
	@rm -fr "$(BUILD_DIR)"
	@rm -fr "$(DIST_DIR)"
