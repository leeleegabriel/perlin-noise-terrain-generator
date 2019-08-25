#!/bin/bash

wget http://download.processing.org/processing-3.5.3-linux-armv6hf.tgz
tar xvfz processing-3.5.3-linux-armv6hf.tgz

echo "@bash $(pwd)/terrain.sh" >> ~/.config/lxsession/LDXE-pi/autostart