FROM nginx:1.17.4-alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY ssl/*.key /etc/ssl/
COPY ssl/*.pem /etc/ssl/
COPY nginx.conf.template /etc/nginx/conf.d

COPY docker-entrypoint.sh ~/
RUN ["chmod", "+x", "~/docker-entrypoint.sh"]
ENTRYPOINT ["~/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]