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

# Add cross-compiler path. Change to your actual path.
export PATH=/opt/GNAT/gcc-arm-eabi/bin:$PATH

# Run the command to generate the run-times overwriting any pre-existing runtime
$BB_RUNTIMES_DIR/build_rts.py --force --output=$BB_RUNTIMES_DIR/$RUNTIMES_DIR --build $TARGET
