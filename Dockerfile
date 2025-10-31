# Use Nginx to serve the pre-built React app
FROM nginx:alpine

# Copy built files to Nginx html directory
COPY build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
