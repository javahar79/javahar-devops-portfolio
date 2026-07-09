# last_verified: 2026-07-09 · Docker 4.25

# Trying a minimal tagged multi-stage build — pinning alpine:3.20
# instead of latest so I know exactly what base I'm getting
FROM alpine:3.20 AS builder

RUN apk add --no-cache curl

# Runtime stage — same base, no build tools
FROM alpine:3.20

RUN addgroup -S app && adduser -S app -G app

COPY --from=builder /usr/bin/curl /usr/bin/curl

USER app

CMD ["sh", "-c", "echo 'hello from tagged non-root image'"]