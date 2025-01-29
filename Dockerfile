# Use Node.js for building the React app
FROM node:16-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . . 

# Build the React app
RUN npm run build

# Use Nginx to serve the built React app
FROM nginx:alpine

# Remove any default files in Nginx HTML directory
RUN rm -rf /usr/share/nginx/html/*

# Copy React build files to Nginx's default serving directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

