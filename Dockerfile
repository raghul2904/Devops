# Use official nginx base image
FROM nginx:alpine

# Remove the default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy the build output from your local machine into nginx's html folder
COPY build/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

