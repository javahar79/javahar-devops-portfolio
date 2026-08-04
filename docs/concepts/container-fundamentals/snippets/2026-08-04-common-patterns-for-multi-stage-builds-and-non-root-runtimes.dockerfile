# last_verified: 2026-08-04 · docker 29.2.0

# I'm trying multi-stage builds so the final image only has what's needed to run,
# not the build tools. This keeps the image small and reduces attack surface.
# Using a non-root user at runtime — running as root in containers is a common
# mistake that adds unnecessary risk.

# --- Stage 1: build ---
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# --- Stage 2: runtime ---
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY package*.json ./

# running as root by default is bad practice — create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000
CMD ["node", "dist/index.js"]