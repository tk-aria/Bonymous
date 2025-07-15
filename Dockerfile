# Multi-stage build for Node.js backend + React frontend
FROM node:18-alpine AS base
WORKDIR /app

# Install dependencies for backend
FROM base AS backend-deps
COPY package*.json ./
RUN npm ci --only=production

# Install dependencies for frontend
FROM base AS frontend-deps
COPY public/package*.json ./public/
RUN cd public && npm ci --only=production

# Build frontend
FROM node:18-alpine AS frontend-build
WORKDIR /app
COPY public/package*.json ./public/
RUN cd public && npm ci
COPY public/ ./public/
RUN cd public && npm run build

# Build backend
FROM node:18-alpine AS backend-build
WORKDIR /app
COPY package*.json ./
COPY tsconfig.json ./
RUN npm ci
COPY src/ ./src/
COPY index.ts ./
RUN npx tsc --outDir dist

# Final runtime image
FROM node:18-alpine AS runtime
WORKDIR /app

# Copy production dependencies
COPY --from=backend-deps /app/node_modules ./node_modules
COPY package*.json ./

# Copy built backend
COPY --from=backend-build /app/dist ./dist

# Copy built frontend
COPY --from=frontend-build /app/public/build ./public/build

# Create uploads directory
RUN mkdir -p uploads

# Expose port
EXPOSE 4000

# Set environment variables
ENV NODE_ENV=production

# Start the application
CMD ["node", "dist/index.js"]