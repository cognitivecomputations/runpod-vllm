#!/bin/bash
set -e

mkdir -p $TRANSFORMERS_CACHE

# Execute the passed arguments (CMD)
exec "$@" --model $MODEL_NAME
