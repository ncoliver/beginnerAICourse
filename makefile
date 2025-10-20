# Include Hugging Face token from .env
include .env
export HUGGINGFACE_HUB_TOKEN

# Create and activate a Python virtual environment + install deps
install:
	python3 -m venv .venv && \
	. .venv/bin/activate && \
	pip install --upgrade pip && \
	pip install -r requirements.txt

# Run training with the token set
train:
	. .venv/bin/activate && \
	python finetuneChatbot.py

# Run both steps
all: install train
