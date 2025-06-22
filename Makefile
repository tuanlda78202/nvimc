# Makefile for Neovim Lua configuration

VENV_PATH := .venv
CHECK_DIRS := .

SHELL := /bin/bash

define run_with_venv
	@if [ -f "$(VENV_PATH)/bin/activate" ]; then \
		source $(VENV_PATH)/bin/activate && $(1); \
	else \
		echo "Virtual environment not found at $(VENV_PATH)"; \
		exit 1; \
	fi
endef

.PHONY: help install install-tools check lint format format-check pre-commit clean test dev-setup ci setup-and-ci lint-fix format-fix auto-fix fix-and-check

# Default target
help:
	@echo "Available targets:"
	@echo "  install       - Install pre-commit hooks and Python dependencies"
	@echo "  install-tools - Install external tools (stylua, luacheck)"
	@echo "  check         - Run all checks (lint + format check + pre-commit)"
	@echo "  lint          - Run luacheck linter"
	@echo "  lint-fix      - Run luacheck and attempt to fix issues"
	@echo "  format        - Format code with stylua"
	@echo "  format-check  - Check formatting without modifying files"
	@echo "  format-fix    - Format code with stylua (alias for format)"
	@echo "  auto-fix      - Auto-fix formatting and re-run checks"
	@echo "  fix-and-check - Fix formatting and verify it passes"
	@echo "  pre-commit    - Run pre-commit hooks on all files"
	@echo "  test          - Run tests (if any)"
	@echo "  clean         - Clean up temporary files"
	@echo "  dev-setup     - Setup development environment (install + install-tools)"
	@echo "  ci            - Run CI checks (lint + format check)"
	@echo "  setup-and-ci  - Setup everything and run checks"

# Install Python dependencies and pre-commit hooks
install:
	@echo "⚒️ Installing Python dependencies..."
	@if ! command -v uv >/dev/null 2>&1; then \
		echo "❌ Error: uv is not installed or not in PATH"; \
		echo "Please install uv: https://docs.astral.sh/uv/getting-started/installation/"; \
		exit 1; \
	fi
	@if [ ! -d "$(VENV_PATH)" ]; then \
		echo "Creating virtual environment..."; \
		uv venv $(VENV_PATH); \
	fi
	$(call run_with_venv,uv pip install --upgrade pip)
	$(call run_with_venv,uv pip install pre-commit)
	@echo "⚒️ Installing pre-commit hooks..."
	$(call run_with_venv,pre-commit install)
	@echo "✅ Python dependencies installation completed successfully!"

# Install external tools (stylua, luacheck)
install-tools:
	@echo "⚒️ Installing external tools..."
	@echo "Installing StyLua..."
	@if command -v brew >/dev/null 2>&1; then \
		brew install stylua; \
	elif command -v cargo >/dev/null 2>&1; then \
		cargo install stylua; \
	else \
		echo "❌ Please install StyLua manually:"; \
		echo "  - Via Homebrew: brew install stylua"; \
		echo "  - Via Cargo: cargo install stylua"; \
		echo "  - Download from: https://github.com/JohnnyMorganz/StyLua/releases"; \
	fi
	@echo "Installing luacheck..."
	@if command -v luarocks >/dev/null 2>&1; then \
		luarocks install luacheck; \
	else \
		echo "❌ Please install LuaRocks first, then run: luarocks install luacheck"; \
		echo "  - macOS: brew install luarocks"; \
	fi
	@echo "✅ External tools installation completed!"

# -- CI --

# Check formatting without modifying files
format-check:
	@echo -en "\n⚒️ Running CI format check...\n"
	@if ! command -v stylua >/dev/null 2>&1; then \
		echo "❌ Error: stylua is not installed"; \
		echo "Run 'make install-tools' to install it"; \
		exit 1; \
	fi
	@echo "Checking formatting with StyLua..."
	stylua --check $(CHECK_DIRS)
	@echo "✅ Format check completed successfully!"

# Run luacheck linter
lint:
	@echo -en "\n⚒️ Running CI lint check...\n"
	@if ! command -v luacheck >/dev/null 2>&1; then \
		echo "❌ Error: luacheck is not installed"; \
		echo "Run 'make install-tools' to install it"; \
		exit 1; \
	fi
	@echo "Running luacheck..."
	luacheck $(CHECK_DIRS) --no-color
	@echo "✅ Lint check completed successfully!"

# Format code with stylua
format:
	@echo "⚒️ Formatting Lua files with StyLua..."
	@if ! command -v stylua >/dev/null 2>&1; then \
		echo "❌ Error: stylua is not installed"; \
		echo "Run 'make install-tools' to install it"; \
		exit 1; \
	fi
	stylua $(CHECK_DIRS)
	@echo "✅ Formatting completed successfully!"

# Format code (alias for format)
format-fix: format

# Lint with potential fixes
lint-fix:
	@echo "⚒️ Running luacheck with fixes..."
	@if ! command -v luacheck >/dev/null 2>&1; then \
		echo "❌ Error: luacheck is not installed"; \
		echo "Run 'make install-tools' to install it"; \
		exit 1; \
	fi
	luacheck $(CHECK_DIRS) --no-color
	@echo "✅ Lint completed successfully!"

# Pre-commit
pre-commit:
	@echo "⚒️ Running pre-commit hooks..."
	$(call run_with_venv,pre-commit run --all-files)
	@echo "✅ Pre-commit hooks completed successfully!"

# Run pre-commit on specific files (usage: make pre-commit-files FILES="file1.lua file2.lua")
pre-commit-files:
	@echo "⚒️ Running pre-commit on specified files..."
	$(call run_with_venv,pre-commit run --files $(FILES))

# Run all CI checks
ci: format-check lint
	@echo "✅ CI checks completed successfully!"

# Run all checks including pre-commit
check: pre-commit ci
	@echo "✅ All checks completed successfully!"

# Test target
test:
	@echo "No tests configured yet"
	@echo "Add your test commands here"

# Clean up temporary files
clean:
	@echo "⚒️ Cleaning up..."
	find . -name "*.tmp" -delete
	find . -name ".luacheckcache" -delete
	@echo "✅ Cleanup completed!"

# Setup development environment
dev-setup: install install-tools
	@echo "✅ Development environment setup complete!"
	@echo "You can now run 'make check' to verify everything works"

# Setup everything and run checks
setup-and-ci: install install-tools ci
	@echo "✅ Setup and CI completed successfully!"

# Auto-fix all issues and re-run checks
auto-fix:
	@echo "⚒️ Auto-fixing formatting issues..."
	@if command -v stylua >/dev/null 2>&1; then \
		stylua $(CHECK_DIRS); \
		echo "✅ Formatting fixed!"; \
	else \
		echo "❌ Error: stylua is not installed"; \
		echo "Run 'make install-tools' to install it"; \
		exit 1; \
	fi
	@echo "⚒️ Re-running format check..."
	$(MAKE) format-check
	@echo "✅ Auto-fix completed successfully!"

# Fix formatting issues when format-check fails
fix-and-check: format format-check
	@echo "✅ Format fixed and verified!"

# -- Act (GitHub Actions Local Runner) --

act-install:
	@echo "⚒️ Installing act as GitHub CLI extension..."
	@if command -v gh >/dev/null 2>&1; then \
		gh extension install https://github.com/nektos/gh-act || \
		echo "✅ Act extension already installed or installation completed"; \
	else \
		echo "❌ GitHub CLI not installed. Install with: brew install gh (macOS) or apt-get install gh (Ubuntu)"; \
		echo "   Or install act directly: curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash"; \
		exit 1; \
	fi
	@echo "✅ Act installation completed!"

act-version:
	@echo "📋 Checking act version and info..."
	@if command -v gh >/dev/null 2>&1 && gh extension list | grep -q gh-act; then \
		gh act --version || gh act --help | head -5; \
	elif command -v act >/dev/null 2>&1; then \
		act --version || act --help | head -5; \
	else \
		echo "❌ Act not found. Run 'make act-install' first"; \
		exit 1; \
	fi

act-check:
	@echo "⚒️ Validating GitHub Actions workflows..."
	@if command -v gh >/dev/null 2>&1 && gh extension list | grep -q gh-act; then \
		gh act -l; \
	elif command -v act >/dev/null 2>&1; then \
		act -l; \
	else \
		echo "❌ Act not found. Run 'make act-install' first"; \
		exit 1; \
	fi
	@echo "✅ Act workflow validation completed!"

act-push:
	@echo "⚒️ Running push event workflows locally..."
	@if command -v gh >/dev/null 2>&1 && gh extension list | grep -q gh-act; then \
		gh act push -v --container-architecture linux/amd64; \
	elif command -v act >/dev/null 2>&1; then \
		act push -v --container-architecture linux/amd64; \
	else \
		echo "❌ Act not found. Run 'make act-install' first"; \
		exit 1; \
	fi

act-clean:
	@echo "⚒️ Cleaning up act containers and volumes..."
	@docker container prune -f --filter "label=act" 2>/dev/null || true
	@docker volume prune -f --filter "label=act" 2>/dev/null || true
	@docker image prune -f --filter "label=act" 2>/dev/null || true
	@echo "✅ Act cleanup completed!"
