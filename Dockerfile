FROM debian:bookworm-slim

RUN apt update && \
    apt install -y --no-install-recommends chrony curl && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/chrony /var/lib/chrony /etc/chrony

# Download Chrony Config from external server or use local fallback
RUN echo '#!/bin/sh
# Download config from external server
if curl -s http://[YOUR_SERVER_IP]/chrony/chrony.conf > /etc/chrony.conf.tmp; then
    mv /etc/chrony.conf.tmp /etc/chrony.conf
else
    # Fallback config if external server is unavailable
    cat > /etc/chrony.conf << EOF
# Fallback Chrony Config (external server unreachable)
server 192.168.178.1 iburst prefer
pool 2.debian.pool.ntp.org iburst
driftfile /var/lib/chrony/chrony.drift
logdir /var/log/chrony
log tracking
maxupdateskew 100.0
rtcsync
makestep 1 3
leapsectz right/UTC
clientloglimit 4194304
EOF
fi
chmod 644 /etc/chrony.conf' > /tmp/init-conf.sh && \
    chmod +x /tmp/init-conf.sh

EXPOSE 123/udp
EXPOSE 323/tcp

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD chronyc tracking || exit 1

# Start with config download, then chrony
CMD ["sh", "-c", "/tmp/init-conf.sh && \
            chown -R $(id -u _chrony 2>/dev/null || id -u chrony):$(id -g _chrony 2>/dev/null || id -g chrony) /run/chrony /var/lib/chrony && \
            chmod 700 /run/chrony /var/lib/chrony && \
            rm -f /run/chrony/chronyd.pid && \
            exec chronyd -f /etc/chrony.conf"]