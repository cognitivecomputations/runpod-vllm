#!/bin/bash
set -e

mkdir -p $TRANSFORMERS_CACHE

# Execute the passed arguments (CMD)
# Check if RUNPOD_GPU_COUNT is greater than 1
if [ "$RUNPOD_GPU_COUNT" -gt 1 ]
then
    # If it is, add --tensor-parallel-size flag with RUNPOD_GPU_COUNT as value
    exec "$@" --model $MODEL_NAME --host $HOST --port $PORT --tensor-parallel-size $RUNPOD_GPU_COUNT $EXTRA_VLLM_ARGS --trust-remote-code
else
    # If it is not, run the command without the --tensor-parallel-size flag
    exec "$@" --model $MODEL_NAME --host $HOST --port $PORT $EXTRA_VLLM_ARGS --trust-remote-code
fi
