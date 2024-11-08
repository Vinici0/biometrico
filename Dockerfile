# Dockerfile for Node.js Backend with TypeScript

# Stage 1: Build the Node.js application
FROM node:18 AS build

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json if available
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the TypeScript project
RUN npm run build

# Stage 2: Run the Node.js application
FROM node:18-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy the built files from the previous stage
COPY --from=build /usr/src/app/dist ./dist
COPY package.json ./

# Install only production dependencies
RUN npm install --only=production

# Expose the desired port (e.g., 3000)
EXPOSE 3000

# Start the application
CMD ["node", "dist/app.js"]

# Instructions:
# 1. Build the Docker image:
#    docker build -t node-backend-app .
# 2. Run the Docker container:
#    docker run -p 3000:3000 node-backend-app