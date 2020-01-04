#!/bin/bash

echo "Deploy smartcap to /usr/local/bin"
sudo cp -pr smartcap /usr/local/sbin
sudo chmod a+rx /usr/local/sbin/smartcap
