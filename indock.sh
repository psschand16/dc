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
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu `lsb_release -cs` test"

#       Update package index (again)
sudo apt-get update -y

apt-cache policy docker-ce

#       Install latest version of Docker CE
sudo apt-get install docker-ce -y
#sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# -------------------------------------------------------------------------------------------------
sleep 1

sudo usermod -aG docker ${USER}



echo "Instaling docker-compose......."

sudo apt install jq -y

sleep 1

DOCKER_COMPOSE_VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
DOCKER_CLI_PLUGIN_PATH=/usr/local/lib/docker/cli-plugins
sudo mkdir -p $DOCKER_CLI_PLUGIN_PATH
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o $DOCKER_CLI_PLUGIN_PATH/docker-compose
sudo chmod +x $DOCKER_CLI_PLUGIN_PATH/docker-compose
sleep 3
sudo ln -s  $DOCKER_CLI_PLUGIN_PATH/docker-compose /usr/local/bin/docker-compose

sleep 2
echo "########################################################"
sudo docker -v
sudo docker-compose --version
echo "########################################################"

# echo "portainer.................."

# docker run -d  -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
echo "#######################snaps#################################"
export PASSWORD=omgam
echo $PASSWORD
sleep 1
sudo apt update -y
sudo apt install snapd -y
sudo snap install snap-store 
sudo snap install code-server --edge 
