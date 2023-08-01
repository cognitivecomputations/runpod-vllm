#!/bin/bash

mkdir -p $TRANSFORMERS_CACHE
python ./download_model.py

# Execute the passed arguments (CMD)
exec "$@"
