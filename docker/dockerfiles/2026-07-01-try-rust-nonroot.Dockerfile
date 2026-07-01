# Build stage — busybox has the tools we need and is tiny (~4MB)
FROM busybox:1.36 AS build

RUN echo '#!/bin/sh' > /hello.sh \
    && echo 'echo "Hello from Docker!"' >> /hello.sh \
    && chmod +x /hello.sh

# Runtime stage — scratch has nothing, not even a shell
FROM scratch

COPY --from=build /hello.sh /hello.sh

# Numeric user — scratch doesn't have /etc/passwd
USER 65534:65534

CMD ["/hello.sh"]
