#!/bin/bash
echo "Checking for model updates..."
echo ""

ollama list | tail -n +2 | awk '{print $1}' | while read model; do
  old_id=$(ollama list | grep "^$model " | awk '{print $2}')
  ollama pull "$model" > /dev/null 2>&1
  new_id=$(ollama list | grep "^$model " | awk '{print $2}')

  if [ "$old_id" != "$new_id" ]; then
    echo "UPDATED: $model ($old_id → $new_id)"
  else
    echo "OK: $model (already current)"
  fi
done
