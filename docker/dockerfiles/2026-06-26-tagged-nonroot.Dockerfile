# Build stage — using golang image because the tutorial used it and it worked
FROM golang:1.22-alpine AS build

WORKDIR /app
COPY hello.go .
# I tried CGO_ENABLED=0 after reading it makes static binaries for alpine
RUN CGO_ENABLED=0 go build -o hello .

# Runtime stage — fresh alpine, no go SDK needed
FROM alpine:3.19

# Creating a non-root user — the docs say this is safer than running as root
RUN adduser -D appuser

COPY --from=build /app/hello /usr/local/bin/hello

USER appuser

CMD ["hello"]
