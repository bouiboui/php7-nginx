FROM quantumobject/docker-alpine
RUN apk --update add php7-fpm nginx
RUN mkdir -p /run/nginx
COPY ${PWD}/conf/nginx.conf /etc/nginx/conf.d/default.conf
CMD php-fpm7 && nginx && /sbin/my_init
