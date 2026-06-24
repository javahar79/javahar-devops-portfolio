# multi-stage build: build a static page then serve from a slim nginx image as non-root
FROM alpine:3.20 AS builder
RUN apk add --no-cache curl
# download a sample page — using --compressed because alpine curl handles it fine
RUN curl -s --compressed -o /tmp/index.html \
    https://raw.githubusercontent.com/nginx/nginx/master/contrib/index.html

FROM nginx:alpine
# nginx runs as root by default — let's fix that
RUN adduser -D -g '' -u 1001 nginxuser && \
    chown -R nginxuser:nginxuser /usr/share/nginx/html /var/cache/nginx /var/run
COPY --from=builder /tmp/index.html /usr/share/nginx/html/index.html
# switch user before exposing the port
USER nginxuser
EXPOSE 80
# nginx -g 'daemon off;' keeps the process in the foreground
CMD ["nginx", "-g", "daemon off;"]
