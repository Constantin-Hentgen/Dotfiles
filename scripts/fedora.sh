#!/bin/bash

# Fedora plymouth
sudo dnf install plymouth-theme-charge.x86_64
plymouth-set-default-theme -l
plymouth-set-default-theme charge
