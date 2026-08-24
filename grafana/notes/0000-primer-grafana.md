---
last_verified: 2026-08-24
tool_version: n/a
sources: []
---

# Grafana — quick primer

> First-day notes for someone who's never used Grafana. Personal voice, plain language.

## What is it?

Grafana is an open-source dashboarding tool that sits on top of data sources like Prometheus, Loki, or SQL databases and draws graphs from them. Think of it like a BI tool but for ops metrics — you connect a data source, create panels, arrange them on a dashboard, and share with your team.

## What does it do?

It queries your data on a schedule and renders the results as line graphs, bar charts, heatmaps, logs, traces, and more. You can combine multiple data sources on a single dashboard and set thresholds that trigger alerts (email, Slack, PagerDuty).

## Key terminology

- **Data source** — The backend Grafana queries (Prometheus, Loki, MySQL, etc.). You add credentials once, then reference it in any dashboard.
- **Dashboard** — A collection of panels arranged in a grid. Saved as JSON (but you edit via UI).

## A tiny example

After installing Grafana (usually via Docker or a package manager), the first thing you do is add a Prometheus data source:

```bash
# Start Grafana and Prometheus together
docker run -d --name=grafana -p 3000:3000 grafana/grafana
docker run -d --name=prometheus -p 9090:9090 prom/prometheus
```

Open `http://localhost:3000`, log in (admin/admin), go to **Configuration → Data Sources → Add data source**, select Prometheus, set URL to `http://prometheus:9090`, and click **Save & Test**. You'll see a green "Data source is working" message. Now you can create a dashboard and add a panel that queries `up` — you should see your Prometheus instance as a green line at `1`.