# Makefile for dotfiles management

# Configuration
STOW_DIR := stow
TARGET_DIR := $(HOME)
PACKAGES := $(shell ls $(STOW_DIR))

.PHONY: all install delete clean help

# Default target
all: help

help: ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install all dotfiles using stow
	@echo "Installing dotfiles..."
	@for package in $(PACKAGES); do \
		echo "Stowing $$package..."; \
		stow -d $(STOW_DIR) -t $(TARGET_DIR) -R $$package; \
	done
	@echo "Done!"

delete: ## Remove all dotfiles symlinks
	@echo "Removing dotfiles symlinks..."
	@for package in $(PACKAGES); do \
		echo "Unstowing $$package..."; \
		stow -d $(STOW_DIR) -t $(TARGET_DIR) -D $$package; \
	done
	@echo "Done!"

clean: ## Backup existing files and remove conflicts
	@./scripts/cleanup_and_backup.sh

packages: ## Install system packages and tools
	@./scripts/packages_install.sh

setup: clean install packages ## Run cleanup/backup, install packages, and stow dotfiles

