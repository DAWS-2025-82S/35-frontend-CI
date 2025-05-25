#FROM nginx
FROM nginx:stable-alpine3.20-perl
RUN rm -rf /usr/share/nginx/html/index.html
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf
RUN mkdir -p /var/cache/nginx/client_temp && \
        mkdir -p /var/cache/nginx/proxy_temp && \
        mkdir -p /var/cache/nginx/fastcgi_temp && \
        mkdir -p /var/cache/nginx/uwsgi_temp && \
        mkdir -p /var/cache/nginx/scgi_temp && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /etc/nginx/ && \
        chmod -R 755 /etc/nginx/ && \
        chown -R nginx:nginx /var/log/nginx

RUN mkdir -p /etc/nginx/ssl/ && \
    chown -R nginx:nginx /etc/nginx/ssl/ && \
    chmod -R 755 /etc/nginx/ssl/

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /run/nginx.pid
COPY nginx.conf /etc/nginx/nginx.conf
COPY code /usr/share/nginx/html/
USER nginx

# Optimised Docker Image

# Remove /etc/nginx/conf.d/default.conf file  since pod is failing in kubernetes 
# because file has the port 80 which is system port(1-1024) which can be accessed with root user
# since the user in docker file is not root user remove the file


# Download the code from https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip

#    - set up project 35-frontend-CI using the downloaded code and Create JenkinsFile for pipeline

#  copy the docker file from 18-expense-docker --> 03-frontend

#  In Jenkins create CI pipeline for frontend EXPENSE-->FRONTEND-->frontend-ci

#  	configure https://github.com/DAWS-2025-82S/35-frontend-CI.git
