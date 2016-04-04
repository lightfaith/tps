#!/bin/bash
# pings important interfaces in specified VRF for g=3, r=2
./pc.sh $1

if [ "$1" == "A" ]; then
	ping -q -c 2 3.3.2.1; echo -e "\n\n";
	ping -q -c 2 33.3.2.1; echo -e "\n\n";
elif [ "$1" == "B" ]; then
	ping -q -c 2 4.3.2.1; echo -e "\n\n";
	ping -q -c 2 44.3.2.1; echo -e "\n\n";
else
	echo "[-] Choose VRF (A/B)!"
	exit 1
fi

