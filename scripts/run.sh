#!/bin/bash

# Prepare yocto environment
source $HOME/src/poky/oe-init-build-env $HOME/build > /dev/null
# Lets play!
exec /usr/bin/bash

