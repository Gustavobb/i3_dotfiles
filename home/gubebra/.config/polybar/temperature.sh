#!/bin/bash

OUT="$(sensors | grep -A2 hwmon-pci | grep temp1 | cut -d '+' -f2)"

echo $OUT

