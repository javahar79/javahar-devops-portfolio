FROM golang:1.22-alpine AS build
WORKDIR /src
COPY main.go .
RUN CGO_ENABLED=0 go build -o /out/hello .

FROM alpine:3.20
RUN adduser -D -h /app appuser
COPY --from=build --chown=appuser:appuser /out/hello /app/hello
USER appuser
WORKDIR /app
CMD ["./hello"]
