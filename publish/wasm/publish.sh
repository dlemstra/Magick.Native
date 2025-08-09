#!/bin/bash
set -e

create_npm_package() {
    local version="$1"

    mkdir files
    sed 's/"version": ""/"version": "$version"/g' package.json > files/package.json

    cd files
    npm pack
}

version=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --version)
      version=$2
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

if [ -z "$version" ]; then
  echo "Error: Version parameter is required"
  exit 1
fi

create_npm_package $version
