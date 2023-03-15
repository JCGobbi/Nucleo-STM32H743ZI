#!/usr/bin/env bash

# This shell script creates embedded runtimes for ARM Cortex-M microcontrollers
# taking into account the directory structure of bb-runtimes from AdaCore with
# the aditional directory for the new processor.
#
# The directory structure for the run-times will be created inside the current
# folder "bb-runtimes" with the name "runtimes".

# Directory where build_rts.py is located
BB_RUNTIMES_DIR=`pwd`

# Name of the target microprocessor.
TARGET=stm32h743

# Path for the new run-times
RUNTIMES_DIR=runtimes

# Delete old runtimes directory
rm -r $BB_RUNTIMES_DIR/$RUNTIMES_DIR
echo "Old runtimes directory deleted."

# Add cross-compiler path. Change to your actual path.
export PATH=/opt/GNAT/gnat-arm-elf/bin:/opt/GNAT/x86_64/bin:$PATH

# Run the command to generate the runtimes
$BB_RUNTIMES_DIR/build_rts.py --rts-src-descriptor="gnat_rts_sources/lib/gnat/rts-sources.json" --force --output=$BB_RUNTIMES_DIR/$RUNTIMES_DIR --build $TARGET
