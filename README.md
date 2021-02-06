# SETUP
```
cd /opt
wget https://raw.githubusercontent.com/kubotan/bash_for_mjpg_streamer/main/main.sh
chmod 755 /opt/main.sh
echo '@reboot /opt/main.sh' >> /var/spool/cron/crontabs/root
echo '*/1 * * * * /opt/main.sh' >> /var/spool/cron/crontabs/root
reboot
```
