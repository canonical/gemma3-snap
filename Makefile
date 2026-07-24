SHELL := /bin/bash

# Always run `hf` via pipx to avoid relying on local `hf` installations.
hf := pipx run --spec "huggingface_hub[cli]" hf

SNAP_NAME ?= gemma3
ENGINE ?= cpu

.PHONY: all help init build install upload smoke-test install-deps init-submodules download-models download-model-270m download-model-4b download-model-4b-ov download-model-4b-mmproj

all: help

#
# Main targets
#

help: ## Show this help message
	@echo "Usage: make <target>"
	@echo
	@echo "Targets:"
	@# List all targets with descriptions (lines starting with '##'):
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*## "}; {printf "  %-11s %s\n", $$1, $$2}'

init: init-submodules install-deps download-models ## Initialize the build environment (dependencies, model weights, submodules, etc.)

build: ## Build the snap
	./dev/build.sh

install: ## Install the snap
	./dev/install.sh

upload: ## Upload the snap
	./dev/upload.sh

smoke-test: ## Run smoke tests (override with SNAP_NAME=... ENGINE=...)
	sudo ./dev/smoke-test.sh $(SNAP_NAME) $(ENGINE)

#
# Supporting targets
#

install-deps:
	@echo "Installing dependencies..."
	@# Ensure pipx is available for running the hf CLI.
	@command -v pipx >/dev/null 2>&1 || { \
		sudo apt-get update; \
		sudo apt-get install -y pipx; \
	}

init-submodules:
	@echo "Initializing submodules..."
	@if git submodule status | grep -q '^-'; then \
		git submodule update --init; \
	fi

download-models: download-model-270m download-model-4b download-model-4b-mmproj download-model-4b-ov

download-model-270m:
	@echo "Downloading Gemma 3 270M Instruct model weights..."
	$(hf) download unsloth/gemma-3-270m-it-GGUF gemma-3-270m-it-Q4_0.gguf \
		--local-dir components/model-270m-it-q4-0-gguf/

download-model-4b:
	@echo "Downloading Gemma 3 4B Instruct model weights..."
	$(hf) download unsloth/gemma-3-4b-it-GGUF gemma-3-4b-it-Q4_0.gguf \
		--local-dir components/model-4b-it-q4-0-gguf/

download-model-4b-mmproj:
	@echo "Downloading Gemma 3 4B MMProj model..."
	$(hf) download unsloth/gemma-3-4b-it-GGUF mmproj-F16.gguf \
		--local-dir components/mmproj-f16-4b-gguf/

download-model-4b-ov:
	@echo "Downloading Gemma 3 4B OV INT4 FQ model artifacts..."
	$(hf) download llmware/gemma-3-4b-it-ov-int4-fq \
		--local-dir components/model-4b-it-int4-fq-ov/gemma-3-4b-it-ov-int4-fq/
	@echo "OVMS writes graph.pbtxt at runtime; pointing it to /tmp because component files are read-only..."
	ln -sfn /tmp/graph.pbtxt components/model-4b-it-int4-fq-ov/gemma-3-4b-it-ov-int4-fq/graph.pbtxt
