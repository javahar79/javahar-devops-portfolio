# multi-stage build with an explicit AS tag so I can copy across stages
FROM alpine:3.20 AS builder
WORKDIR /src
# kept it simple — just make a script instead of compiling real code
RUN echo '#!/bin/sh' > greet.sh && \
    echo 'echo "Hello from $(whoami) — UID $(id -u)"' >> greet.sh && \
    chmod +x greet.sh

FROM alpine:3.20
# create a non-root user — alpine uses adduser/addgroup not useradd
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /src/greet.sh .
# switch to non-root before CMD so the process never runs as root
USER appuser
CMD ["./greet.sh"]
