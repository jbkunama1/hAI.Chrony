FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends chrony tzdata && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/chrony /var/lib/chrony /var/log/chrony

COPY chrony.conf /etc/chrony.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 123/udp
EXPOSE 323/tcp

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD chronyc tracking || exit 1

CMD ["/entrypoint.sh"]
