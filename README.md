# intel-gpu-monitor-telegraf
Collect intel gpu monitoring data with telegraf to influxdb2/grafana

# Usage
- Clone the repo to a local directory `git clone https://github.com/dvision1979/intel-gpu-monitor-telegraf.git`
- Change to the cloned directory `cd intel-gpu-monitor-telegraf`
- Customize to your needs all values marked with CHANGEME in `telegraf/telegraf.conf`
- Raise the container with `docker compose up -d`
- Check the logs with `docker compose logs -f`
- Check the collected data in InfluxDB
- Import the dashboard in Grafana (after you configured the InfluxDB datasource)
- Happy Intel monitoring :)

![image](https://github.com/user-attachments/assets/32ab496e-896d-4dfa-8eae-ab3d5e12dc77)
