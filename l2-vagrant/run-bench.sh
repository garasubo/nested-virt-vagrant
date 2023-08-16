#!/bin/bassh

set -euxo pipefail

if ! which sysbench ; then
    curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | sudo bash
    sudo apt -y install sysbench
fi

sysbench cpu

