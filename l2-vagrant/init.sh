#!/bin/bash

set -euxo pipefail

echo "hello world"
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | sudo bash
sudo apt-get -y install sysbench
