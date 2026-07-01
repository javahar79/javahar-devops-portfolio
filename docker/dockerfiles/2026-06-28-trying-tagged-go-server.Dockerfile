# Trying a tagged multi-stage Go build with non-root runtime
# Build stage — compiling the Go binary in a full Go environment
FROM golang:1.22-alpine AS build
WORKDIR /src

# Embedding a tiny Go HTTP server — keeps everything self-contained
RUN cat > main.go <<'GOEOF'
package main

import (
    "fmt"
    "log"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintln(w, "Hello from a tagged, non-root container!")
    })
    log.Println("Listening on :8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
GOEOF

RUN go mod init server && go build -o /server .

# Runtime stage — minimal alpine image, no Go toolchain
FROM alpine:3.20
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build --chown=appuser:appgroup /server /server
USER appuser
EXPOSE 8080
CMD ["/server"]
