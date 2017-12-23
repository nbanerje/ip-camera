# ip-camera
Save a rtsp stream from your IP camera to S3

1. I used a t2.nano instance with Ubuntu from AWS and setup a S3 bucket.
2. Clone this repo in the ubuntu home directory
3. Start by running `sudo -i`, so you don't have to type sudo for all commands.
4. Install the aws CLI `pip install awscli --upgrade --user` and then run `aws configure` follow steps [here](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration)
5. You'll want to install avconv by running `apt-get install avconv`
6. Next copy recordCam.sh in to the ubuntu user home directory `/home/ubuntu`, make sure to update `url` in the script to your cameras
7. Move cam.service to `/etc/systemd/system`
8. Run `systemctl daemon reload`
9. Run `systemctl enable cam`
10. Copy copy_files to `/root/`
11. Run `crontab -e` and copy paste the line in the `crontab` file, save and exit by typing esc : wq
12. That's all! Now look at your stremed files saved to your s3 bucket!



