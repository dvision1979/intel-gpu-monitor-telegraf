FROM telegraf

USER root

RUN apt-get update && apt-get install intel-gpu-tools -y

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
