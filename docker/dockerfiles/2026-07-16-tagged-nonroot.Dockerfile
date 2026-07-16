# last_verified: 2026-07-16 · Docker n/a
# Multi-stage build: compile a static Go binary, then ship in a scratch-like runtime as non-root
# Build:  docker build -t my-app:v1.0.0 .
# Run:    docker run --rm -p 3000:3000 my-app:v1.0.0
# Needs main.go with an HTTP server listening on :3000

FROM golang:1.23-alpine AS builder
WORKDIR /src
COPY go.mod go.sum* ./
RUN go mod download 2>/dev/null || true
COPY . .
RUN CGO_ENABLED=0 go build -o /app/server .

FROM alpine:3.21
RUN adduser -D appuser
COPY --from=builder /app/server /server
USER appuser
EXPOSE 3000
CMD ["/server"]
