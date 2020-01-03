#!/bin/bash

echo "Deploy smartcap to /usr/local/bin"
sudo cp -pr smartcap /usr/local/bin
sudo chmod a+rx /usr/local/bin/smartcap
