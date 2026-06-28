# Build stage — compiling a static Go binary
FROM golang:1.22-alpine AS build

WORKDIR /src
# Copy only go.mod first so dependency layers cache
COPY go.mod go.sum ./
RUN go mod download
# Then copy source — this layer invalidates only when main.go changes
COPY main.go .
RUN CGO_ENABLED=0 go build -o /app .

# Runtime stage — scratch keeps it tiny, no shell, no tools
FROM scratch

# Tag the image with a build date label
LABEL org.opencontainers.image.created="2026-06-28"
LABEL org.opencontainers.image.title="hello-server"

# Static binary from build stage — no libc needed because CGO_ENABLED=0
COPY --from=build /app /app

# Non-root by default on scratch — there's no /etc/passwd but the binary
# can still run as USER 1001 which beats running as root

USER 1001

EXPOSE 8080

CMD ["/app"]
