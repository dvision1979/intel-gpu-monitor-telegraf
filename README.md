# intel-gpu-monitor-telegraf
Collect intel gpu monitoring data with telegraf to influxdb2/grafana

# Usage
- Clone the repo to a local directory
- Customize to your needs all values marked with CHANGEME in `telegraf/telegraf.conf`
- Raise the container with `docker compose up -d`
- Check the logs with `docker compose logs -f`
- Happy Intel monitoring :)
