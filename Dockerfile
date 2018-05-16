#
# Ubuntu Dockerfile for Moobi
#
# https://github.com/
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y nginx && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  add-apt-repository -y ppa:ondrej/php && \
  apt-get update && \
  apt-get install zip unzip && \
  apt-get install php7.2 && \
  apt-get install php7.2-fpm php7.2-mbstring php7.2-xml php7.2-mysql php7.2-zip php7.2-gd php7.2-curl php7.2-redis && \
  apt-get install redis-tools && \

# Limpando o cache das instalações é sempre recomendável remover do container tudo aquilo que não for mais
# necessário após tudo configurado assim o container fica menor
  rm -rf /var/lib/apt/lists/*

# Instalando composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Configurando o Nginx
# Aqui copiamos nosso arquivo de configuração para dentro do container
# Note que ainda não criamos esse arquivo, criaremos mais à frente
COPY nginx.conf /etc/nginx/nginx.conf

# Arquivo de configuração do supervisor
# Idem ao Nginx, será criado mais adiante
COPY supervisord.conf /etc/supervisord.conf

# Criando o diretório onde ficará nossa aplicação
RUN mkdir -p /app

# Definindo o diretório app como nosso diretório de trabalho
WORKDIR /app

# Dando permissões para a pasta do projeto
RUN chmod -R 755 /app

# Expondo as portas
EXPOSE 80 443

# Finalmente... Iniciando tudo... Ufa...
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
