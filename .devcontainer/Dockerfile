#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------
FROM mcr.microsoft.com/oryx/build:vso-20200719. as kitchensink

RUN { echo && echo "PATH=${EXTRA_PATHS_OVERRIDES}:\$PATH:${USER_EXTRA_PATHS}" ; } | tee -a /etc/bash.bashrc >> /etc/skel/.bashrc \
    && { echo && echo $BASH_PROMPT ; } | tee -a /etc/bash.bashrc >> /etc/skel/.bashrc \
    && printf "$FISH_PROMPT" >> /etc/fish/conf.d/fish_prompt.fish \
    && { echo && echo $ZSH_PROMPT ; } | tee -a /etc/zsh/zshrc >> /etc/skel/.zshrc \
    && useradd --create-home --shell /bin/bash codespace \
    && mkdir -p /etc/sudoers.d \
    && echo "codespace ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd \
    && echo "Defaults secure_path=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin:${EXTRA_PATHS}\"" >> /etc/sudoers.d/securepath \
    && sudo -u codespace mkdir /home/codespace/.vsonline \
    && groupadd -g 800 docker \
    && usermod -a -G docker codespace

USER codespace
