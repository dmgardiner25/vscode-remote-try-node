#!/bin/bash

set -ex

splitSdksDir="/opt/dotnet/sdks"

allSdksDir="/home/vsonline/.dotnet"
mkdir -p "$allSdksDir"

# Copy latest muxer and license files
cp -f "$splitSdksDir/3/dotnet" "$allSdksDir"
cp -f "$splitSdksDir/3/LICENSE.txt" "$allSdksDir"
cp -f "$splitSdksDir/3/ThirdPartyNotices.txt" "$allSdksDir"

function createLinks() {
    local sdkVersion="$1"
    local runtimeVersion="$2"
    
    cd "$splitSdksDir/$sdkVersion"

    # Find folders with name as sdk or runtime version
    find . -name "$sdkVersion" -o -name "$runtimeVersion" | while read subPath; do
        # Trim beginning 2 characters from the line which currently looks like, for example, './sdk/2.2.402'
        subPath="${subPath:2}"
        
        linkFrom="$allSdksDir/$subPath"
        linkFromParentDir=$(dirname $linkFrom)
        mkdir -p "$linkFromParentDir"

        linkTo="$splitSdksDir/$sdkVersion/$subPath"
        ln -s $linkTo $linkFrom
    done
}

createLinks "3.1.201" "3.1.3"
echo
createLinks "3.0.103" "3.0.3"
echo
createLinks "2.2.402" "2.2.7"
echo
createLinks "2.1.805" "2.1.17"
echo
createLinks "1.1.14" "1.1.13"