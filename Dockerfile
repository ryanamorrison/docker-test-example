FROM nginx:alpine
COPY index.html /usr/share/nginx/html
# to copy test certs
COPY throwaway.crt /etc/nginx/certs/certificate.crt
COPY throwaway.key /etc/nginx/certs/certificate.key

# default values
ENV SERVERNAME=example.com
ARG SERVERPORT=443

RUN echo "server { \
  listen 443 ssl; \
  server_name ${SERVERNAME}; \
  ssl_certificate /etc/nginx/certs/certificate.crt; \
  ssl_certificate_key /etc/nginx/certs/certificate.key; \
  location / { \
    root /usr/share/nginx/html; \
    index index.html index.htm; \
  } \
}" > /etc/nginx/conf.d/default.conf

EXPOSE $SERVERPORT

