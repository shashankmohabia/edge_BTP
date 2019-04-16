#!/bin/sh
echo "Welcome to your ubuntu instance!!!\n"
echo "Running application on remote instance...\n\nResult:"
prefix='/home/ubuntu/'
check='script.sh'
for file in /home/ubuntu/test_images/*
do
  result=${file#"$prefix"}
  echo "$result"
  sudo perf stat docker run --rm -v $(pwd):/data:ro openalpr -c eu $result
done
#sleep 5s
