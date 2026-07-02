# Stage 1: build
FROM alpine:3.19 AS build
RUN apk add --no-cache go
WORKDIR /src
COPY hello.go .
RUN go build -o /app hello

# Stage 2: minimal runtime with non-root user
FROM alpine:3.19
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build --chown=appuser:appgroup /app /app
USER appuser
CMD ["/app"]
