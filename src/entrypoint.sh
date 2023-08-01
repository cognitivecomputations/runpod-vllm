#!/bin/bash

mkdir -p $TRANSFORMERS_CACHE

# Execute the passed arguments (CMD)
exec "$@"
