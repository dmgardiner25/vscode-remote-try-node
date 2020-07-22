#!/bin/bash
echo "Set script to fail if any command in script returns non zero return code"
set -exuo pipefail

image="mcr.microsoft.com/vscode/devcontainers/universal:0.9.0-linux" 
echo "Pulling universal image $image"
docker pull $image


echo "Pulling base images..."

docker pull ubuntu:bionic
docker pull ubuntu:latest
docker pull centos
docker pull mcr.microsoft.com/vscode/devcontainers/base:0-debian-10

echo "Pulling language images"

docker pull mcr.microsoft.com/vscode/devcontainers/javascript-node:0-12
docker pull mcr.microsoft.com/vscode/devcontainers/python:0-3
docker pull mcr.microsoft.com/vscode/devcontainers/python:3.6
docker pull mcr.microsoft.com/vscode/devcontainers/python:3.7
docker pull mcr.microsoft.com/dotnet/core/sdk:3.1
docker pull mcr.microsoft.com/dotnet/core/aspnet:3.1
docker pull php:7-cli
docker pull rust:1
docker pull openjdk:8-jdk
docker pull golang:1

df