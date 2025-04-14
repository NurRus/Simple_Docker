FROM nginx
WORKDIR /home
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh .
ENTRYPOINT [ "sh", "./entrypoint.sh" ]
HEALTHCHECK NONE