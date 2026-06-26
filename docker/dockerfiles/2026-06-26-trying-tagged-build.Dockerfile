# Multi-stage build with tagged build stage and non-root runtime
# Build stage tag lets docker build --target build re-use the stage
# Using Python because the base images are well-known and small

FROM python:3.12-slim AS build
WORKDIR /src
# Copy only requirements first to leverage Docker cache unless requirements change
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.12-alpine AS runtime
# create a non-root user; -D means no login password, -H skips home dir
RUN adduser -D -H appuser
# copy only the installed packages from build stage, not the build tools
COPY --from=build /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=build /usr/local/bin /usr/local/bin
COPY app.py /app/app.py
USER appuser
WORKDIR /app
CMD ["python", "app.py"]
