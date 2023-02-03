FROM nginx:alpine-slim
COPY ./public_html/ /usr/share/nginx/html
EXPOSE 80
#Para subir una imagen a  github
#Con LABEL le asignamos directamente al repositorio donde se hacemos el push
LABEL org.opencontainers.image.source https://github.com/albertosantiago-lt/hello-2048
#Para hacer log en github primero tenemos que generar un token en github Settings/Developer settings/Personal access tokens
#Creamos un token clasico con permisos de delete y write packages 
#Copiamos la clave y la metemos en un archivo para logear con el
#Comando de log
#cat PAT.txt | docker login ghcr.io -u AlbertoSantiago-LT --password-stdin
#Comando para hacer el build
#docker build -t "ghcr.io/albertosantiago-lt/hello-2048/hello2048:v1" .
#Comando para subirlo al github
#docker push ghcr.io/albertosantiago-lt/hello-2048/hello2048:v2


