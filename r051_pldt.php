#!/bin/sh wget http://lucasliam.com/r051Marukoy/r051-pldt-8bands.bin -O /tmp/firmware.bin mtd -r write /tmp/firmware.bin /dev/mtd5 > /dev/null 2>&1
