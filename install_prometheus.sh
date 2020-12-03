#!/bin/bash
wget https://github.com/prometheus/prometheus/releases/download/v2.22.2/prometheus-2.22.2.linux-amd64.tar.gz
mkdir /etc/prometheus
mkdir /var/lib/prometheus
tar zxvf prometheus-*.linux-amd64.tar.gz
cd prometheus-*.linux-amd64
cp prometheus promtool /usr/local/bin/
cp -r console_libraries consoles prometheus.yml /etc/prometheus
useradd --no-create-home --shell /bin/false prometheus
chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus
chown prometheus:prometheus /usr/local/bin/{prometheus,promtool}
cd .. 
cp prometheus.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable prometheus
chown -R prometheus:prometheus /var/lib/prometheus
systemctl start prometheus
systemctl status prometheus
