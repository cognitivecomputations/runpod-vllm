#!/bin/bash

mkdir -p $TRANSFORMERS_CACHE

python3 -c "import os;print(os.environ)"

# Execute the passed arguments (CMD)
HUGGING_FACE_HUB_TOKEN=$HUGGING_FACE_HUB_TOKEN python download_model.py

exec "$@"
