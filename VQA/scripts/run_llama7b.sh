#!/bin/bash

source /raid/ABC123/med-flamingo/envs/Llama1-7b_venv/bin/activate

if [ -z "$VIRTUAL_ENV" ]; then
    echo "ERROR: Failed to activate venv"
    exit 1
fi

export MODEL="/raid/ABC123/med-flamingo/models/Llama1-7b"

python /raid/ABC123/med-flamingo/scripts/demo.py
