# Docker Tutorial

docker run hello_world   = exec a imagem hello_world, sendo que, se não houver localmente, o Docker vai baixar do docker hub.
docker run -ti centos:7      =  comando -ti habilita terminal e interação, alem disso passamos a imagem e a versão
Control + d = mata o shell do container e se tiver rodando so o bash, matará o container.
Control + p + q = vai sair do container sem matar o processo
docker ps = lista todos os container que estão rodando
docker attach <container id> = entra no container
docker stop(ou start)  <container id> = parar (ou iniciar) um container pelo sei id
docker images
docker ps -a = lista todos os container criados localmente
docker stats <container id> = verifica quanto está consumindo de recursos da maquina 
docker rm <container id> = deleta/remove o container
docker rmi <image id> = remove images armazenadas

# Limitar os recursos do Container
docker run -ti —memory 512m — name teste debian = limita a quantidade de memoria para o container durante a criação 
docker inspect  <container id> | grep -i mem  = verifica quantidade de memória através do inspect
docker update -m 256m teste

DESCOMPLICANDO O DOCKER V1 - 07 limitando cpu

docker run -ti -v /Users/deyvisonpenha/projects/primeiro_dockerfile:/Volume ubuntu 



# Dockerfile

docker build -t moobi_imagem:1.0 .  = constrói a imagem através de um Dockerfile

docker rm $(docker ps -a -q) = remove todos os containers local

docker rmi $(docker images -a) = remove todas as imagens

docker network create --subnet 172.18.0.0/16 rede_teste


dpkg -l  = Listar programas instalados 
touch <nome.extensao> = cria um arquivo
