FROM nginx:latest
# Copy the built files from the previous stage
COPY build/ /usr/share/nginx/index.html
