
# Stage 1: Build Stage

FROM node:20-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies efficiently and leverage layer caching
COPY package*.json ./

# Set up npm cache in a designated directory to improve caching
RUN --mount=type=cache,target=/app/.npm \
    npm set cache /app/.npm && \
    npm install

# Copy the entire application source code
COPY . .

# Run the build command to generate production-ready artifacts
RUN npm run build


# Stage 2: Deployable Image

FROM nginx

# Expose the port that the Nginx server will listen on
EXPOSE 80

# Copy the built artifacts from the build stage to the Nginx HTML directory
COPY --from=build /app/dist /usr/share/nginx/html