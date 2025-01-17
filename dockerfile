FROM nginx:latest
WORKDIR usr/share/nginx/html
COPY build/ /usr/share/nginx/html 
CMD ["nginx", "-g", "daemon off;"]
