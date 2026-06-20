# syntax=docker/dockerfile:1
FROM alpine:3.20 AS build
WORKDIR /src
RUN echo '#!/bin/sh' > greet.sh && \
    echo 'echo "Hello from $(whoami)!"' >> greet.sh && \
    chmod +x greet.sh

FROM alpine:3.20
RUN adduser -D appuser
COPY --from=build /src/greet.sh /usr/local/bin/greet
USER appuser
CMD ["greet"]
