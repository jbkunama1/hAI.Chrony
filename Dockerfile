FROM debian:bookworm-slim

RUN apt update && \
    apt install -y --no-install-recommends chrony && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/chrony /var/lib/chrony /etc/chrony

COPY chrony.conf /etc/chrony/chrony.conf

EXPOSE 123/udp
EXPOSE 323/tcp

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD chronyc tracking || exit 1

CMD ["sh", "-c", "mkdir -p /run/chrony /var/lib/chrony && \
                    chown -R $(id -u _chrony 2>/dev/null || id -u chrony):$(id -g _chrony 2>/dev/null || id -g chrony) /run/chrony /var/lib/chrony && \
                    chmod 700 /run/chrony /var/lib/chrony && \
                    rm -f /run/chrony/chronyd.pid && \
                    exec chronyd -d -f /etc/chrony.conf"]
