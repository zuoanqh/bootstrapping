#!/bin/bash

cd ~/local/tmp
wget -O "micro-1.4.1-linux64.tar.gz" "https://github.com/zyedidia/micro/releases/download/v1.4.1/micro-1.4.1-linux64.tar.gz"
tar -xvzf "micro-1.4.1-linux64.tar.gz"
mv micro-1.4.1/micro ~/bin/
