#!/bin/bash

# -----------------------------
# CONFIG
# -----------------------------
USER="ABC123"
MODEL="Llama1-7b"
ENV_DIR="/raid/$USER/med-flamingo/envs"
ENV_NAME="${MODEL}_venv"
PYTHON_BIN="python3.10"
REQ_FILE= "med-flamingo/requirements/requirements_med-flamingo.txt"

# -----------------------------
# Internal
# -----------------------------
FULL_ENV_PATH="$ENV_DIR/$ENV_NAME"

echo "Creating environment at: $FULL_ENV_PATH"
mkdir -p "$ENV_DIR"

$PYTHON_BIN -m venv "$FULL_ENV_PATH"

echo "Activating environment..."
source "$FULL_ENV_PATH/bin/activate"

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing PyTorch 2.0.0 (cu117)..."
pip install torch==2.0.0 torchvision==0.15.1 \
    -f https://download.pytorch.org/whl/cu117

echo "Installing open_clip (specific commit)..."
pip install git+https://github.com/usuyama/open_clip.git@01a53cc46662d8b28da0c9d73271bfb8f6f4b20d

echo "Installing datasets/wandb/einops packages..."
pip install datasets==2.9.0 wandb==0.13.10 einops==0.6.0 einops_exts==0.0.4

echo "Installing h5py + ipykernel..."
pip install h5py ipykernel

echo "Installing requirements from REQ file..."
pip install -r "$REQ_FILE"

echo "Installing PyTorch 2.4.1 + cu124 stack..."
pip install torch==2.4.1+cu124 torchvision==0.19.1+cu124 torchaudio==2.4.1+cu124 \
  --index-url https://download.pytorch.org/whl/cu124

echo "Environment setup complete!"
echo "Environment located at:"
echo "$FULL_ENV_PATH"
