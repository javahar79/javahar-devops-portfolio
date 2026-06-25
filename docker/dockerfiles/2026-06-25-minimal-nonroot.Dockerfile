# syntax=docker/dockerfile:1
FROM alpine:3.19 AS builder
WORKDIR /src
RUN echo '#!/bin/sh' > hello.sh && \
    echo 'echo "Hello from non-root container!"' >> hello.sh && \
    chmod +x hello.sh

FROM alpine:3.19
# create a non-root user — the builder image doesn't have one
RUN adduser -D -h /app appuser
COPY --from=builder /src/hello.sh /app/hello.sh
USER appuser
WORKDIR /app
CMD ["./hello.sh"]
