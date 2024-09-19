#!/bin/bash

# Verifica se está rodando como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root."
  exit
fi

# Função principal que executa cada etapa modular
main() {
  echo "Iniciando configuração do servidor..."

  echo "1. Configurando o servidor e instalando Docker..."
  bash ./scripts/setup_docker.sh

  echo "2. Inicializando Docker Swarm..."
  bash ./scripts/setup_swarm.sh

  echo "3. Criando diretórios de volumes para os containers..."
  bash ./scripts/setup_folders.sh

  echo "4. Subindo Portainer..."
  bash ./scripts/deploy_portainer.sh

  echo "5. Subindo serviços (Pi-hole, Traefik, bancos de dados, Nextcloud, etc.)..."
  bash ./scripts/deploy_services.sh

  echo "Configuração finalizada!"
}

# Chama a função principal
main
