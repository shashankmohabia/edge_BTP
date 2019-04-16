#!/bin/sh

while true
do
#running application on local machine.
echo "\nRunning application on local machine...\n\nResult:"
prefix='/home/satya/Downloads/'
for file in /home/satya/Downloads/test_images/*
do
  result=${file#"$prefix"}
  echo "$result"
  sudo perf stat docker run -it --rm -v $(pwd):/data:ro openalpr -c eu $result
done

#check for internet connectivity.
if nc -zw1 google.com 443 && echo |openssl s_client -connect $test:443 2>&1 |awk '
  handshake && $1 == "Verification" { if ($2=="OK") exit; exit 1 }
  $1 $2 == "SSLhandshake" { handshake = 1 }'
then
  echo "Found active internet connection. Connecting to your aws instance...\n"
  if(tail -n+3 /proc/net/wireless | grep -q .)
  then echo "Wireless connection found.\n"
  else echo "Wired connection found.\n"
  fi

  #running application on aws instance.
  ssh -i/home/satya/Downloads/key.pem ubuntu@ec2-13-232-7-69.ap-south-1.compute.amazonaws.com "sh s2.sh"
  echo "\nConnection to instance closed."
else echo "No internet connection found. Can't connect to your aws instance."
fi

#sleep 5s
echo
done
