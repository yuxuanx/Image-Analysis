#!/bin/bash

cd ~
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.5.0-Linux-x86_64.sh
bash Anaconda2-2.5.0-Linux-x86_64.sh -b
export PATH="~/anaconda2/bin/:$PATH"
pip install -r https://raw.githubusercontent.com/Lasagne/Lasagne/v0.1/requirements.txt --user
pip install --user Lasagne==0.1

echo '#The next line was added for the course SSY096' >> ~/.bashrc
echo 'export PATH="~/anaconda2/bin/:$PATH"' >> ~/.bashrc