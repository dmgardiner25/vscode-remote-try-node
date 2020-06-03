#!/bin/bash
image="mcr.microsoft.com/vscode/devcontainers/universal:0.5.0-linux" 
echo "Pulling universal image $image"
docker pull $image