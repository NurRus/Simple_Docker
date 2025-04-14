FROM nginx
WORKDIR /home/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./mini_server.c .
COPY ./entrypoint.sh .
RUN apt update && apt install -y gcc spawn-fcgi libfcgi-dev
ENTRYPOINT [ "sh", "./entrypoint.sh" ]
