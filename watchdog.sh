#!/usr/bin/env bash
VIDEOS=/home/ubuntu/videos
EMAIL='YOUREMAIL@YOURDOMAIN.COM'
previous_time=$(stat -c '%Y' $VIDEOS)
current_time=$(date +%s)
number_of_seconds=$(( current_time - previous_time ))
MAX_WAIT=$(( 20*60 ))
SLEEP=$(( 10*60 ))
echo "previous time $previous_time"
echo "current time $current_time"
echo "num secs $number_of_seconds"

while [[ ${number_of_seconds} -lt ${MAX_WAIT} ]]
do
#   echo ${SLEEP}
   sleep ${SLEEP}
#   echo $number_of_seconds
#   echo $previous_time
#   echo $current_time
   previous_time=$(stat -c '%Y' $VIDEOS)
   current_time=$(date +%s)
   number_of_seconds=$(( current_time - previous_time ))
echo "previous time $previous_time"
echo "current time $current_time"
echo "num secs $number_of_seconds"

done
mail -s "Camera watchdog timeout" ${EMAIL} <<< "Difference: ${number_of_seconds} \
directory last write time: ${previous_time} \
current time: ${current_time}"
echo "Timed out"
echo "previous time $previous_time"
echo "current time $current_time"
echo "num secs $number_of_seconds"
echo "timeout period $MAX_WAIT"
echo "sleep period $SLEEP"
echo "restarting cam"
systemctl restart cam
echo "sleeping 180 seconds / 3 minutes"
sleep 180
