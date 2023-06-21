#!/bin/bash
URL=$LINK
ZIP=$(echo "$URL" | grep -oP '[^/]*$')
FILE=$(echo "$URL" | grep -oP '(?<=/)[^/]+(?=\.zip)')
GITHUB=$GITURL
REPO=$(echo "$GITHUB" | grep -o "bhargavguntreddi98.github.io")
SERVER="apache2"
sudo apt update
sudo apt install wget unzip net-tools $SERVER -y
sudo systemctl start $SERVER
sudo systemctl enable $SERVER
wget $URL
unzip $ZIP
git clone $GITHUB
ls
pwd
cd $REPO
rm -rf *
cd ..
cp -r ./$FILE/* ./deployment.sh /home/vsts/work/1/s/$REPO
cd $REPO
ls
git config --global user.email "$EMAIL" 
git config --global user.name "$USERNAME" 
git status
git add .
git commit -m "$COMMIT_MESSAGE"
git status
git push origin HEAD:main
echo "https://bhargavguntreddi98.github.io/"