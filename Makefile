PROJECT_NAME		:= remove-microsoft-remote-desktop
IDENTIFIER		:= de.bjoernalbers.$(PROJECT_NAME)
VERSION			:= $(shell git describe --tags | tr -d v)
SCRIPTS_DIR		:= scripts
PAYLOAD_DIR		:= $(shell mktemp -d)
BUILD_DIR		:= $(shell mktemp -d)
COMPONENT_PKG		:= $(BUILD_DIR)/$(PROJECT_NAME).pkg
DISTRIBUTION_PKG	:= $(PROJECT_NAME).pkg

ifndef PKG_SIGN_IDENTITY
$(error PKG_SIGN_IDENTITY is not set)
endif

ifeq ($(strip $(VERSION)),)
$(error No git tag found to determine version)
endif

build:
	pkgbuild \
		--identifier "$(IDENTIFIER)" \
		--version "$(VERSION)" \
		--scripts "$(SCRIPTS_DIR)" \
		--sign "$(PKG_SIGN_IDENTITY)" \
		--quiet \
		--root "$(PAYLOAD_DIR)" \
		"$(COMPONENT_PKG)"
	productbuild \
		--package "$(COMPONENT_PKG)" \
		--sign "$(PKG_SIGN_IDENTITY)" \
		--quiet \
		"$(DISTRIBUTION_PKG)"
	rm -rf "$(BUILD_DIR)" "$(PAYLOAD_DIR)"

.PHONY: build
