#!/bin/bash
# configures pc as client for specified VRF for g=3, r=2
dev="eth0"

inet="7.8.9.1"

if [ "$1" == "A" ]; then
	address="3.3.2.2/24";
	gw="3.3.2.1";
	rsr="33.3.2.0/30";
	nei="3.3.1.0/30";
elif [ "$1" == "B" ]; then
	address="4.3.2.2/24";
	gw="4.3.2.1";
	rsr="44.3.2.0/30";
	nei="4.3.1.0/30";
else
	echo "[-] Choose VRF (A/B)!"
	exit 1
fi

ip ad fl dev $dev
ip ad ad $address dev $dev

ip ro add $rsr via $gw dev $dev
ip ro add $inet via $gw dev $dev
ip ro add $nei via $gw dev $dev

