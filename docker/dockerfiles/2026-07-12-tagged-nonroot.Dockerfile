# last_verified: 2026-07-12 · Docker 29.2.0
# Minimal tagged multi-stage build — compile a static Go binary, then run as non-root
# Build:  docker build -t hello-server:v1.0.0 .
# Run:    docker run --rm -p 8080:8080 hello-server:v1.0.0
# Needs main.go and go.mod alongside this file in the build context

FROM golang:1.23-alpine AS builder
WORKDIR /src
COPY go.mod go.sum* ./
RUN go mod download 2>/dev/null || true
COPY main.go .
RUN CGO_ENABLED=0 go build -o /app/server .

FROM alpine:3.21
RUN adduser -D appuser
COPY --from=builder /app/server /server
USER appuser
EXPOSE 8080
CMD ["/server"]
