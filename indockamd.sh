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

# sudo docker run -d  -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

# sudo docker run -d  -p 127.0.0.1:9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

#  0.0.0.0:9000->9000/tcp
# echo "#######################snaps#################################"
# export PASSWORD=omgam
# echo $PASSWORD
# sleep 1
# sudo apt update -y
# sudo apt install snapd -y
# sudo snap install snap-store 
# sudo snap install code-server --edge 
# sudo code-server --port 8001

# ===========================================
# install codeserver
curl -fOL https://github.com/coder/code-server/releases/download/v4.9.1/code-server_4.9.1_amd64.deb
# curl -fOL https://github.com/coder/code-server/releases/download/v4.9.1/code-server_4.9.1_arm64.deb
# curl -fOL https://github.com/coder/code-server/releases/download/v$VERSION/code-server_${VERSION}_amd64.deb
# sudo dpkg -i code-server_${VERSION}_amd64.deb
sudo dpkg -i code-server_4.9.1_amd64.deb
sudo systemctl enable --now code-server@$USER 
# Now visit http://127.0.0.1:8080. Your password is in ~/.config/code-server/config.yaml
sleep 2
# =============================================
# https://coder.com/docs/code-server/latest/guide#using-lets-encrypt-with-caddy
# install caddy
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

sudo systemctl reload caddy

sudo ufw allow 80
sudo ufw allow 81
sudo ufw allow 8001
sudo ufw allow 9000
# ============================================

# cat /etc/caddy/Caddyfile

# sudo mv /etc/caddy/Caddyfile .

sudo PORT=8001 PASSWORD=omgam1 code-server
sudo caddy reload  Caddyfile
sudo systemctl restart caddy
sudo systemctl reload caddy
# sudo caddy run
# sudo kill $(sudo lsof -t -i:2019)
# sudo ufw allow 9000,80,81,8001 
# sudo ufw --force enable && sudo ufw allow 3389 && sudo ufw status 
# sudo ufw reload