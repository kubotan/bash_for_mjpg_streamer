#!/bin/bash

declare -A devices=(
  ['/dev/video0']=8000
  ['/dev/video1']=8001
)

is_reprobe=0
for device in "${!devices[@]}"
do
  if [ `ls -l $device | /usr/bin/wc -l` -ne 1 ]
  then
    echo 'No found:'$device
    is_reprobe=1
  fi
done

if [ $is_reprobe -eq 1 ]
then
  echo 'Start reprobe...'
  /usr/bin/pkill mjpg_streamer
  /sbin/rmmod uvcvideo
  /sbin/modprobe uvcvideo
fi

for device in "${!devices[@]}"
do
  if [ `ps aux | grep 'mjpg_streamer' | grep $device | /usr/bin/wc -l` -ne 1 ]
  then
    echo 'Restart port:'${devices[$device]}
    /usr/local/bin/mjpg_streamer -b -i 'input_uvc.so -f 30 -r 1920x1080 -d '$device' -n -q 100 -dv_timings' -o 'output_http.so -p '${devices[$device]}
    # front
    #/usr/local/bin/mjpg_streamer -b -i 'input_uvc.so -f 30 -r 1920x1080 -d '$device' -n -y -q 100 -dv_timings' -o 'output_http.so -p '${devices[$device]}
  fi
done
