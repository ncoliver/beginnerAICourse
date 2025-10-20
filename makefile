# Include Hugging Face token from .env
include .env
export HUGGINGFACE_HUB_TOKEN

PYTHON := python3
VENV := .venv
ACTIVATE := . $(VENV)/bin/activate

# Create and activate a Python virtual environment + install deps
install:
	sudo apt update
	sudo apt install -y $$(apt-cache search ^python3.[0-9]+-venv | head -n1 | cut -d' ' -f1)
	$(PYTHON) -m venv $(VENV)
	$(ACTIVATE) && pip install --upgrade pip && pip install -r requirements.txt

# Run training with the token set
train:
	$(ACTIVATE) && python finetuneChatbot.py

# Run both steps
all: install train
