#!/bin/bash

cd ~
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.5.0-Linux-x86_64.sh
bash Anaconda3-2.5.0-Linux-x86_64.sh -b
export PATH="~/anaconda3/bin/:$PATH"
pip install Theano
pip install Lasagne==0.1

echo 'export PATH="~/anaconda3/bin/:$PATH"' >> ~/.bashrc
source ~/.bashrc