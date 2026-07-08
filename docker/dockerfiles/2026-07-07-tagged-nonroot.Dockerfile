# last_verified: 2026-07-07 · Docker 4.25

# Build stage
FROM node:22-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# Runtime stage
FROM node:22-alpine

RUN addgroup --system app && adduser --system --ingroup app app

WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY server.js .

USER app

EXPOSE 3000

CMD ["node", "server.js"]
