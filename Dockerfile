# Use Node 20 Alpine for smaller image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lockfile
COPY package*.json ./
COPY pnpm-lock.yaml ./

# Install dependencies (pnpm or npm)
RUN npm ci

# Copy the rest of the project
COPY . .

# Build the Next.js app
RUN npm run build

# Expose default Next.js port
EXPOSE 3000

# Start the app
CMD ["npm", "run", "dev"]
