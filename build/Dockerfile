# Use the official Nginx base image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy static website files (HTML, CSS, JS) to the container
COPY ./build /usr/share/nginx/html

# Copy a custom Nginx configuration file (if needed)
# COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
