#!/bin/bash

# Change this to your DNS server
DNS='127.0.0.1#5300'

# Change this to your ipset name
IPSET=gfwlist

# Path to save you rule file
RULE_FILE=./gfwlist.conf

# Add your own extra domain here. One domain in a line.
EX_DOMAIN='.google.com
.google.com.hk
.google.com.tw
.google.com.sg
.google.co.jp
.blogspot.com
.blogspot.sg
.blogspot.hk
.blogspot.jp
.gvt1.com
.gvt2.com
.gvt3.com
.1e100.net
.github.com
.blogspot.tw'
python ./gfwlist2dnsmasq.py

echo '#extra domains' >> $RULE_FILE

for each_line in $EX_DOMAIN
do
	echo 'server=/'$each_line'/'$DNS >> $RULE_FILE
	echo 'ipset=/'$each_line'/'$IPSET >> $RULE_FILE
done
