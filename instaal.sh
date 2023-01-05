echo ""
echo "-------------------------------------------------------------------------------------------------------------------------"
echo "update serer                                                                                                             "
echo "-------------------------------------------------------------------------------------------------------------------------"
echo ""
sudo apt update
sudo apt upgrade -y

echo ""
echo "-------------------------------------------------------------------------------------------------------------------------"
echo "fixed locate                                                                                                             "
echo "-------------------------------------------------------------------------------------------------------------------------"
echo ""
export LC_ALL="en_US.UTF.8"
export LC_CTYPE="en_US.UTF.8"
dpkg-reconfigure locales

echo ""
echo "-------------------------------------------------------------------------------------------------------------------------"
echo "install NGINX                                                                                                            "
echo "-------------------------------------------------------------------------------------------------------------------------"
echo ""
sudo apt -y install NGINX

echo ""
echo "-------------------------------------------------------------------------------------------------------------------------"
echo "install cerbot                                                                                                           "
echo "-------------------------------------------------------------------------------------------------------------------------"
echo ""
add-apt-repository ppa:cerbot/cerbot
sudo apt update
sudo apt install -y python-cerbot-nginx

echo ""
echo "-------------------------------------------------------------------------------------------------------------------------"
echo "install multichain                                                                                                       "
echo "-------------------------------------------------------------------------------------------------------------------------"
echo ""
cd /tmp
wget https://www.multichain.com/Download/multichain-2.0-alpha-5.tar.gz
tar -xvzf multichain-2.9-alpha-5.tar.gz
cd multichain-2.0-alpha-5
mv multichain multichain-cli multichain-util /usr/local/bin/
cd ~

echo ""
echo "-------------------------------------------------------------------------------------------------------------------------"
echo "configure firewall                                                                                                       "
echo "-------------------------------------------------------------------------------------------------------------------------"
echo ""
ufw allow OpenSSH 
ufw allow in 443/tcp comment "https: for cerbot"
ufw allow "Nginx HHTP"
ufw allow in 1986/tcp comment "multichain peer to peer connections"
ufw enable 
ufw status

echo ""
echo "-------------------------------------------------------------------------------------------------------------------------"
echo "installing nodejs                                                                                                        "
echo "-------------------------------------------------------------------------------------------------------------------------"
echo ""
sudo apt install nodejs -y 

echo "Linking /usr/bin/nodejs to usr/bin/node"
ln -s /usr/bin/nodejs /usr/bin/node 
sudo apt -y install libtool pkg-config build-essential autoconf automake 


