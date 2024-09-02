#!/bin/bash

# Function to show usage
help() {
  echo "todo"
  exit 1
}

# Ensure the correct number of arguments are provided
if [ $# -ne 2 ]; then
  help
fi

ENV=""
ACTION=""

# Parse arguments
case $1 in
  --local)
    ENV="local"
    ;;
  --prod)
    ENV="prod"
    ;;
  *)
    help
    ;;
esac

case $2 in
  start)
    ACTION="start_pg"
    ;;
  stop)
    ACTION="stop_pg"
    ;;
  migration)
    ACTION="flyway_migration"
    ;;
  clean)
    ACTION="clean"
    ;;
  *)
    help
    ;;
esac

# Construct the script name
SCRIPT="bin/${ENV}/${ACTION}.sh"

echo "env: $ENV"
echo "script: $SCRIPT"
/bin/bash "$SCRIPT"
