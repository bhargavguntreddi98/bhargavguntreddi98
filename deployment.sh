#!/bin/bash
URL="https://templatemo.com/tm-zip-files-2020/templatemo_518_sentra.zip"
ZIP=$(echo "$URL" | grep -oP '[^/]*$')
FILE=$(echo "$URL" | grep -oP '(?<=/)[^/]+(?=\.zip)')
sudo apt update
sudo apt install wget unzip net-tools apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
wget $URL
unzip $ZIP
cp -r $FILE/* /var/www/html/
sudo systemctl restart apache2

