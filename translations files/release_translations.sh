#!/bin/bash

# Release translation files

for file in $(ls -1 | sed -e 's/\..*$//'); do
	lrelease $file.ts -qm $file.qm
done
