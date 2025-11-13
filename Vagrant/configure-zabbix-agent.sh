
SHORT_HOSTNAME="ubuntu-karmazinm"
sudo hostnamectl set-hostname "$SHORT_HOSTNAME"
sudo cp -v /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf-orig

sudo sed -i "s/^Hostname=.*/Hostname=$SHORT_HOSTNAME/" /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/^Server=.*/Server=enceladus.pfsense.cz/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/^ServerActive=.*/ServerActive=enceladus.pfsense.cz/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/^# Timeout=3/Timeout=30/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/^# HostMetadata=.*/HostMetadata=SPOS/' /etc/zabbix/zabbix_agent2.conf

sudo diff -u /etc/zabbix/zabbix_agent2.conf-orig /etc/zabbix/zabbix_agent2.conf || true
sudo systemctl restart zabbix-agent2
sudo systemctl status zabbix-agent2 --no-pager
