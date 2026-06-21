FROM alpine:3.19 AS build
# using alpine because it's small; builder stage for any compilation
RUN apk add --no-cache curl

FROM alpine:3.19
# copy only what we need from build stage — keeps final image small
COPY --from=build /usr/bin/curl /usr/bin/curl
RUN adduser -D appuser
USER appuser
CMD ["curl", "--version"]
