#!/bin/bash
#cd ..
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar zxvf node_exporter-*.linux-amd64.tar.gz
cd node_exporter-*.linux-amd64
sudo cp node_exporter /usr/local/bin/
sudo useradd --no-create-home --shell /bin/false nodeusr
sudo chown -R nodeusr:nodeusr /usr/local/bin/node_exporter
cd ..
cp node_exporter.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
systemctl status node_exporter
