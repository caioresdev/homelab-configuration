#!/bin/bash

# Atualiza o sistema e instala Docker e Docker Compose
echo "Atualizando pacotes e instalando Docker..."
apt-get update && apt-get upgrade -y
apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Instalação do Docker
echo "Instalando Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && apt-get install docker-ce docker-ce-cli containerd.io -y

# Instalação do Docker Compose
echo "Instalando Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Verifica a instalação do Docker Compose
echo "Verificando instalação do Docker Compose..."
docker-compose --version

# Adiciona seu usuário ao grupo docker (para não precisar de sudo ao usar docker)
echo "Adicionando usuário ao grupo docker..."
usermod -aG docker $USER

# Ativa e inicia o Docker automaticamente no boot
echo "Habilitando Docker para iniciar automaticamente no boot..."
systemctl enable docker
systemctl start docker

# Exibe mensagem de conclusão
echo "Instalação do Docker e Docker Compose concluída com sucesso!"