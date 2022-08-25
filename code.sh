#!/bin/bash
sudo apt-get update
sudo apt-get install default-jre -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo apt-get install apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt-get update && sudo apt-get install elasticsearch -y
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo service elasticsearch start
sudo curl http://localhost:9200

sudo apt-get install logstash -y

sudo apt-get install kibana -y

sudo mv /tmp/kibana.yml /etc/kibana/kibana.yml
sudo service kibana start

# install metricbeat
sudo apt-get install metricbeat
sleep 10
sudo service metricbeat start

# start logstash
sudo mv /tmp/apache.conf /etc/logstash/conf.d/apache.conf
sleep 15
sudo service logstash start


