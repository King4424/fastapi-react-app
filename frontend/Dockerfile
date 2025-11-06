# Use Node.js to build React app
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build

# Use lightweight web server for serving static files
FROM nginx:1.25-alpine
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 for frontend
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
