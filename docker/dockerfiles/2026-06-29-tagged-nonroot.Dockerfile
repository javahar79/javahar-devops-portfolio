# build stage — include tools here, they won't carry to the final image
FROM alpine:3.19 AS build
RUN apk add --no-cache curl
WORKDIR /app
RUN echo "Hello from a tagged multi-stage build!" > /app/hello.txt

# final stage — keep it lean, no build deps, no root
FROM alpine:3.19
RUN adduser -D appuser
COPY --from=build /app/hello.txt /app/hello.txt
USER appuser
CMD ["cat", "/app/hello.txt"]
