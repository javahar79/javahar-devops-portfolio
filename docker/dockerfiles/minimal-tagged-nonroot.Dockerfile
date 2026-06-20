# using the AS build tag so I can copy artifacts across stages
FROM alpine:3.20 AS build
WORKDIR /src
# kept the script simple — a multi-stage build without compiling anything
RUN echo '#!/bin/sh' > run.sh && \
    echo 'echo "Hello from non-root container!"' >> run.sh && \
    chmod +x run.sh

FROM alpine:3.20
# alpine has adduser/addgroup, no useradd needed
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=build /src/run.sh .
USER appuser
CMD ["./run.sh"]
