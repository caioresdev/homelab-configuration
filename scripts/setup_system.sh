#!/bin/bash

# Verifica se está rodando como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root."
  exit
fi

echo "Atualizando lista de pacotes..."
apt-get update -y

echo "Atualizando pacotes existentes..."
apt-get upgrade -y

echo "Atualizando o sistema (incluindo o kernel)..."
apt-get dist-upgrade -y

echo "Instalando pacotes necessários (nano, net-tools)..."
apt-get install -y nano net-tools

echo "Removendo pacotes desnecessários..."
apt-get autoremove -y

echo "Atualização e instalação concluídas com sucesso!"

# Exibe a versão do Kernel atualizada
echo "Versão do Kernel após atualização:"
uname -r
