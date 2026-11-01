# hAI.Chrony - Index & Overview

Dieses Dokument dient als Index für das hAI.Chrony Projekt – einen **NTP-Zeitserver** für dein lokales Netzwerk, der gleichzeitig als **Zeitclient** mit externen Quellen synchronisiert.

## Inhaltsverzeichnis
- [README.md](README.md) – Übersicht, Features und Setup-Anleitung (Server/Client Dual-Mode).
- [Dockerfile](Dockerfile) – Container-Build-Definition mit Debian Bookworm-slim und Chrony.
- [chrony.conf](chrony.conf) – Konfiguration als dualer Zeitserver und Client (`local stratum 10`, Upstream-Server, Debian-Pools).
- [.github/workflows/docker-publish.yml](.github/workflows/docker-publish.yml) – CI/CD Pipeline für automatischen GHCR-Build (ghcr.io/jbkunama1/hai-chrony:latest).

## Kurzanleitung

**Client-Konfiguration** (andere Geräte):
```
server IP_DEINES_CHRONY_CONTAINERS iburst
# z.B.: server 192.168.178.42 iburst
```

**Container starten** (Portainer Stack):
- Docker Compose Stack aus `README.md` einbinden
- GHCR: `ghcr.io/jbkunama1/hai-chrony:latest`

**Status prüfen**:
- `chronyc tracking` im Container
- `chronyc sources` zeigt Upstream-Server
