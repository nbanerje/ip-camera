# ip-camera
Save a rtsp stream from your IP camera to S3

. I used a t2.nano instance with Ubuntu from AWS and setup a S3 bucket.
. Clone this repo in somewhere on the instance
. Start by running `sudo -i`, so you don't have to type sudo for all commands.
. Install the aws CLI pip install awscli --upgrade --user and then run `aws configure` follow steps [here](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration)
. You'll want to install avconv by running `apt-get install avconv`
. Next copy recordCam.sh in to the ubuntu user home directory `/home/ubuntu`, make sure to update `url` in the script to your cameras
. Move cam.service to `/etc/systemd/system`
. Run `systemctl daemon reload`
. Run `systemctl enable cam`
. Copy copy_files to `/root/`
. Run `crontab -e` and copy paste the line in the `crontab` file, save and exit by typing esc : wq
. That's all! Now look at your stremed files saved to your s3 bucket!



