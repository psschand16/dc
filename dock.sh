start_time="$(date -u +%s.%N)"
echo "starting docker 1"

sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
# sudo apt install apt-transport-https ca-certificates curl software-properties-common -y


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# --------------------------------------------------------------------------------
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu focal stable"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu `lsb_release -cs` test"

#       Update package index (again)
sudo apt-get update -y

apt-cache policy docker-ce

#       Install latest version of Docker CE
sudo apt-get install docker-ce -y
#sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# -------------------------------------------------------------------------------------------------
sleep 3

sudo usermod -aG docker ${USER}



echo "Instaling docker-compose......."

sudo apt install jq -y

sleep 2

DOCKER_COMPOSE_VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
DOCKER_CLI_PLUGIN_PATH=/usr/local/lib/docker/cli-plugins
sudo mkdir -p $DOCKER_CLI_PLUGIN_PATH
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o $DOCKER_CLI_PLUGIN_PATH/docker-compose
sudo chmod +x $DOCKER_CLI_PLUGIN_PATH/docker-compose
sleep 3
sudo ln -s  $DOCKER_CLI_PLUGIN_PATH/docker-compose /usr/local/bin/docker-compose

sleep 2

sudo docker -v
sudo docker-compose --version


echo "portainer.................."

# sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

# sudo docker run -d -p 8000:8000 -p 9000:9000 --net=host --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce


sudo apt update -y
sudo apt install snapd -y
sudo snap install snap-store 
# sudo snap install code --classic 
sudo snap install codium --classic 
sudo snap install 
code-server --edge 

# ============uninstall================
# dpkg -l | grep -i docker

# To identify what installed package you have:

# Step 2

# sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin
# sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin
# sudo rm -rf /var/lib/docker /etc/docker
# sudo rm /etc/apparmor.d/docker
# sudo groupdel docker
# sudo rm -rf /var/run/docker.sock
# =======================================
# Uninstall the Docker Engine, CLI, and Containerd packages:
# sudo apt-get purge docker-ce docker-ce-cli containerd.io

# Delete all images, containers, and volumes:

# sudo rm -rf /var/lib/docker
# sudo rm -rf /var/lib/containerd

# Remove previous versions:
# sudo apt-get remove docker docker-engine docker.io containerd runc

# ==============edit sources=================================
# Open /etc/apt/sources.list file by running

# sudo nano /etc/apt/sources.list

# Comment out the following line:
# #deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
# Press Ctrl+o to save, ctrl+x to close.
# ====================================
# if test -r /etc/profile; then
#         . /etc/profile
# fi

# if test -r /etc/default/locale; then
#         . /etc/default/locale
#         test -z "${LANG+x}" || export LANG
#         test -z "${LANGUAGE+x}" || export LANGUAGE
#         test -z "${LC_ADDRESS+x}" || export LC_ADDRESS
#         test -z "${LC_ALL+x}" || export LC_ALL
#         test -z "${LC_COLLATE+x}" || export LC_COLLATE
#         test -z "${LC_CTYPE+x}" || export LC_CTYPE
#         test -z "${LC_IDENTIFICATION+x}" || export LC_IDENTIFICATION
#         test -z "${LC_MEASUREMENT+x}" || export LC_MEASUREMENT
#         test -z "${LC_MESSAGES+x}" || export LC_MESSAGES
#         test -z "${LC_MONETARY+x}" || export LC_MONETARY
#         test -z "${LC_NAME+x}" || export LC_NAME
#         test -z "${LC_NUMERIC+x}" || export LC_NUMERIC
#         test -z "${LC_PAPER+x}" || export LC_PAPER
#         test -z "${LC_TELEPHONE+x}" || export LC_TELEPHONE
#         test -z "${LC_TIME+x}" || export LC_TIME
#         test -z "${LOCPATH+x}" || export LOCPATH
# fi

# if test -r /etc/profile; then
#         . /etc/profile
# fi

# test -x /etc/X11/Xsession && exec /etc/X11/Xsession
# exec /bin/sh /etc/X11/Xsession
# ======================================================
sudo apt-get update  -y
sudo apt-get upgrade -y

echo "starting ufw......"

sudo ufw --force enable && sudo ufw allow 3389 && sudo ufw status 
sudo ufw reload
sudo ufw status

sudo apt-get install xrdp -y
sudo adduser xrdp ssl-cert

sudo apt-add-repository ppa:ubuntu-mate-dev/ppa -y
sudo apt-add-repository ppa:ubuntu-mate-dev/trusty-mate -y

echo "updating and upgrading again"
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install xrdp -y

echo "starting mate core"
sudo DEBIAN_FRONTEND=noninteractive apt-get install ubuntu-mate-core -y 

echo "starting mate desktop......"
sudo DEBIAN_FRONTEND=noninteractive apt-get install ubuntu-mate-desktop -y 

echo mate-session >~/.xsession
sudo service xrdp restart
sudo service xrdp restart
# sudo service xrdp restart
# sleep 3
# sudo reboot
# =============================================
# =============================================
end_time="$(date -u +%s.%N)"

elapsed="$(bc <<<"$end_time-$start_time")"
echo "Total of $elapsed seconds elapsed for process"
# Total of 448.874908248 seconds elapsed for process