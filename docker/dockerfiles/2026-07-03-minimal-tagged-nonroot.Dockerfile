# last_verified: 2026-07-03 - Docker 4.25
# Trying a tagged multi-stage build with non-root runtime
# Build stage — compiling a Go HTTP server
FROM golang:1.22-alpine AS build
WORKDIR /src

# Keeping the server source inline so the Dockerfile stays self-contained
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

# Runtime stage — minimal alpine, no Go toolchain carried over
FROM alpine:3.20
# Creating a non-root user — rootless is recommended in 2026 docs
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build --chown=appuser:appgroup /server /server
USER appuser
EXPOSE 8080
CMD ["/server"]
