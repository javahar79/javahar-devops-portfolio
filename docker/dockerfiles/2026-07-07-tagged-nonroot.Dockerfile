# last_verified: 2026-07-07 · Docker 4.25

# Build stage — uses the full Go image, which is ~800 MB
FROM golang:1.22-alpine AS builder

WORKDIR /src
COPY go.mod go.sum main.go ./
RUN go build -o /app/server .

# Runtime stage — fresh alpine, just the binary + non-root user
FROM alpine:3.20

RUN addgroup -S app && adduser -S -G app app

WORKDIR /app
COPY --from=builder /app/server .

USER app

EXPOSE 8080

CMD ["./server"]
