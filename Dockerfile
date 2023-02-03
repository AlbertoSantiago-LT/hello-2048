FROM caddy:alpine
COPY ./public_html/ /usr/share/caddy/
EXPOSE 80
