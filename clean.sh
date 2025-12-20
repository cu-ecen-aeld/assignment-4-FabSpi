#!/bin/sh
# clean.sh script to perform a full distclean of the buildroot directory
# Author: Fabian

# -C springt in den buildroot-ordner
# distclean löscht ALLES: .config, alle gebauten Pakete und die Toolchain
make -C buildroot distclean