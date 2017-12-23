#!/bin/bash
# recordCam.sh
# The file name. I use the date to make finding files easier.
url='username:passsword@yourdomain.ddns.net:554/11'
BASEpath='/home/ubuntu'

avconv -rtsp_transport tcp -i rtsp://${url} \
-c:v copy -an -map 0 -f segment -segment_time 300 -segment_format mp4 -strict -2 \
-strftime 1 "$BASEpath/capture-%03d-%Y-%m-%d_%H-%M-%S.mp4" 2>>/tmp/cam01.log
