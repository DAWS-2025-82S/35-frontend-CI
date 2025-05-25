FROM nginx
RUN rm -rf /usr/share/nginx/html/index.html
RUN rm -rf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY code /usr/share/nginx/html/


# docker build -t frontend:1.0.0 .
# docker run -d -p 80:80 --name frontend --network expense frontend:1.0.0

# docker exec -it frontend bash
# cat /etc/nginx/nginx.conf


########## for host network ####################
# change container name to localhost in nginx.conf

# docker build -t frontend:1.0.0 .
# docker run -d --name frontend --network host frontend:1.0.0

# Host network is less secure and ports will exhaust
