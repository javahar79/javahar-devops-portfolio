# Build stage: compile the Go binary
# Using alpine-based golang keeps the build image ~300MB instead of 800MB+
FROM golang:1.22-alpine AS build
WORKDIR /src
# Copying go.mod first lets Docker cache the module download separately from source changes
COPY go.mod main.go ./
RUN go build -o /out/app .

# Runtime stage: minimal alpine without build tools
FROM alpine:3.20
# adduser -D creates a system user (no password); -h gives it a home directory
RUN adduser -D -h /app appuser
# --chown ensures the binary is owned by the non-root user, not root
COPY --from=build --chown=appuser:appuser /out/app /app/app
USER appuser
WORKDIR /app
CMD ["./app"]
