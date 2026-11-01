FROM debian:bookworm-slim

RUN apt update && \
    apt install -y --no-install-recommends chrony && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/chrony /var/lib/chrony

# Expose ports for NTP and Chrony Control
EXPOSE 123/udp
EXPOSE 323/tcp

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD chronyc tracking || exit 1

CMD ["chronyd", "-d", "-f", "/etc/chrony/chrony.conf"]