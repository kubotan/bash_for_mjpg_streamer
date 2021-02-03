# SETUP
```
cd /opt
wget https://raw.githubusercontent.com/kubotan/bash_for_mjpg_streamer/main/mjpg_streamer.sh
chmod 755 /opt/mjpg_streamer.sh
echo '@reboot /opt/mjpg_streamer.sh' >> /var/spool/cron/crontabs/root
reboot
```
