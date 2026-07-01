# Docker getting-started guide — what tripped me up this time

I decided to go through the official Docker getting-started guide (the one at docs.docker.com/get-started/) one more time, but I used Python this time instead of Node to see how much carries over. The guide's sample app is Node-based, so I had to adapt as I went.

## Following along with a Python app

The guide has you clone a sample repo for a todo app. Instead, I created a tiny Flask app:

```python
# app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello from Docker!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

Then I wrote a Dockerfile:

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app.py"]
```

The build worked fine (`docker build -t flask-app .`). Running it was where I hit snags.

## Where things broke

**Port 5000 on macOS.** On macOS, AirPlay Receiver uses port 5000 by default. Docker gave me a "port is already allocated" error with no hint that it was AirPlay. I spent 10 minutes checking if something else was running before I remembered this macOS thing. Fixed with `-p 5001:5000`.

**The container ran but I couldn't reach it.** I used `docker run -dp 5001:5000 flask-app`. The container started but `curl localhost:5001` returned nothing. Turned out Flask defaults to binding on `127.0.0.1` inside the container, not `0.0.0.0`. The guide doesn't mention this because their Node app listens on all interfaces by default. I changed `app.run(host='0.0.0.0')` and it worked.

**Build cache — pip install vs COPY order.** I had `COPY . .` before `RUN pip install` at first, so every source change re-ran the entire pip install. Fixed by ordering it like the guide: `COPY requirements.txt .` first, then `RUN pip install`, then `COPY . .`. This way pip install only re-runs when requirements.txt changes.

**Tagging confusion.** I built with `docker build -t flask-app .` but the tag was `flask-app:latest`. When I wanted to push a specific version, I had to learn `docker tag flask-app flask-app:v1` separately. The guide shows `-t` but doesn't explain that omitting the tag defaults to `latest`.

## What I'd try next

I want to try `docker init` with a Python app — apparently it auto-generates the Dockerfile and compose.yml. Also need to figure out how to do health checks with Python since the guide uses wget but the slim image doesn't have it installed.

497 words
