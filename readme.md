# Home Lab - Docker Swarm com Aplicações e Serviços

Este repositório é dedicado à configuração e automação do meu homelab. 

Utiliza dois servidores para rodar um cluster Docker Swarm e aplicações para gerenciamento de conteúdo e administração. 
Este ambiente utiliza o Docker Compose para a configuração e gerenciamento dos serviços.

## Infraestrutura

### Servidor 1
- **Processador**: Intel Core i3-2328M
- **Memória RAM**: 8GB DDR3
- **Armazenamento**: 450GB HDD
- **Sistema Operacional**: Ubuntu 22.04 LTS

### Servidor 2
- **Processador**: Intel Core i7-7700
- **Memória RAM**: 16GB DDR4
- **Armazenamento**: 256GB SSD + 450GB HDD
- **Placa de Vídeo**: Nvidia GTX 750 Ti
- **Sistema Operacional**: Ubuntu 22.04 LTS

## Estrutura do Cluster

Os dois servidores acima estão configurados para rodar um **cluster Docker Swarm**, permitindo a execução distribuída das aplicações, com administração simplificada via **Portainer**.

## Aplicações Hospedadas

### Ferramentas de Administração

- **Portainer**: Interface gráfica para gerenciar o cluster Docker Swarm.
- **Traefik**: Proxy reverso e load balancer, gerenciando o roteamento de tráfego para as diferentes aplicações.
- **Pi-hole**: Servidor DNS para resolução de nomes de domínio personalizados e filtragem de anúncios.

### Serviços de Banco de Dados

- **MongoDB**: Banco de dados não relacional para armazenamento de dados de aplicações.
- **PostgreSQL**: Outro banco de dados relacional utilizado por alguns serviços.
- **Redis**: Banco de dados em memória usado para cache e suporte a algumns serviços.

### Aplicações de Armazenamento de Conteúdo

- **Nextcloud**: Plataforma de armazenamento de arquivos e sincronização, substituindo serviços de nuvem como Google Drive e Dropbox.
- **Immich**: Solução de gerenciamento de fotos e vídeos, similar ao Google Photos.
- **Jellyfin**: Sistema de gerenciamento de mídia para filmes, séries e desenhos.
- **Stump ou Kavita**: Aplicação para leitura de e-books e gerenciamento de bibliotecas digitais.

### VPN e Acesso Remoto

- **Tailscale**: VPN para permitir o acesso remoto ao home lab de forma segura e privada.

### Gerenciamento de Servidores de Jogos

- **Crafty**: Interface para administrar servidores de Minecraft.
- **Lodestone**: Outra ferramenta para gerenciamento de servidores de Minecraft com foco em automação.

## Docker Compose e Docker Swarm

Este repositório utiliza **Docker Compose** para definir e orquestrar os serviços que são executados no cluster Docker Swarm.

### Como Subir o Ambiente

Para iniciar as aplicações no cluster Docker Swarm, siga os passos abaixo:

1. Clone este repositório no servidor principal (ou em ambos os servidores):
   ```bash
   git clone https://github.com/seu-usuario/home-lab.git
   cd home-lab
