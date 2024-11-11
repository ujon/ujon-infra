#!/bin/bash

# Function to show usage
help() {
  echo "Usage: $0 <action> <parameter>"
  echo ""
  echo "Actions:"
  echo "  start       Start the PostgreSQL database"
  echo "  stop        Stop the PostgreSQL database"
  echo "  migration   Perform Flyway migration"
  echo "  validate    Validate Flyway scripts"
  echo "  secret      Generate a GitHub Actions secret key"
  echo "  clean       Clean up resources"
  echo ""
  echo "Examples:"
  echo "  $0 start prod"
  echo "  $0 migration dev"
  exit 1
}

# Ensure the correct number of arguments are provided
if [ $# -ne 1 ]; then
  help
fi

ACTION=""

case $1 in
  start)
    ACTION="pg_start"
    ;;
  stop)
    ACTION="pg_stop"
    ;;
  migration)
    ACTION="flyway_migration"
    ;;
  validate)
    ACTION="flyway_validate"
    ;;
  secret)
    ACTION="secret_generate"
    ;;
  clean)
    ACTION="clean"
    ;;
  *)
    help
    ;;
esac

# Construct the script name
SCRIPT="bin/${ACTION}.sh"

echo "script: $SCRIPT"
/bin/bash "$SCRIPT"
