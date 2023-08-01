#!/bin/bash

mkdir -p $TRANSFORMERS_CACHE

python3 -c "import os;print(os.environ)"

# Execute the passed arguments (CMD)
exec "$@"
