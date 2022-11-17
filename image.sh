set -x
sudo apt-get update -y
echo "installing git"
apt-get install -y git
sudo apt-get install -y git
echo "installing nodejs and npm packages"
sudo apt install nodejs npm
echo "Installing docker"
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install docker-ce
echo "Start docker service"
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker ubuntu
echo "clonning code"
mkdir /app
git clone https://github.com/rmarkbio/within3-weather-station.git /app
cd /app

docker build . -t nodejs
docker run -p 49160:8080 -d nodejs
docker ps