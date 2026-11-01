# hAI.Chrony

Ein containerisiertes NTP-Zeitsynchronisations-Setup mit **Chrony** auf Basis von Debian Bookworm-slim, optimiert für den Einsatz in Portainer-Stacks und mit automatisierter CI/CD-Pipeline über GitHub Container Registry (GHCR). Der Container fungiert gleichzeitig als **NTP-Server** für dein lokales Netzwerk und als **Client** für Zeitquellen (lokales Gateway, Debian-Pools).

---

## Features
- **Zeitserver & Zeitclient**: Einerseits für andere Geräte im Netzwerk als Zeitquelle verfügbar, andererseits selbst synchronisiert.
- **Lokale Source**: `local stratum 10` aktiviert → dein Container ist für andere Devices sichtbar.
- **Upstream-Server**: Synchronisiert sich über lokales Gateway (`192.168.178.1`) und öffentliche Debian-Pools.
- **Portainer Ready**: Läuft direkt als Stack (Docker Compose).
- **Automatisierter GHCR Build**: GitHub Actions baut das Image bei jedem Release/Push vollautomatisch.

---

## Konfiguration & Nutzung als Zeitquelle

### Als Zeitserver für andere Devices

Andere Geräte (Computer, Router, etc.) im selben Netzwerk können sich an deinem Chrony-Container als Zeitquelle binden. In der NTP-Konfiguration der Clients diesen Server eintragen:

```conf
# In chrony.conf oder /etc/systemd/timesyncd.conf
server IP_DEINES_CHRONY_CONTAINERS iburst
# Beispiel:
server 192.168.178.42 iburst
```

Sobald die Zeitquelle gesetzt ist, ziehen sich alle verbundenen Devices automatisch die korrekte Zeit von deinem Chrony-Container.

### Als Zeitclient (die Chrony-Instanz selbst)

Der Container holt sich die Zeit von externen Quellen:
- **Priorität 1**: Dein lokales Gateway (`192.168.178.1`) - iburst für schnelle Synchronisation.
- **Priorität 2**: Debian-Pools (`2.debian.pool.ntp.org`) als Fallback.

Damit gewährleistigst du:
- Sichere, kurze Laufwege zur Zeitquelle.
- Fallback auf öffentliche Pool-Server, falls dein lokales Gateway ausfällt.

---

## Portainer Stack (Docker Compose)

Verwende diesen Stack in Portainer, um das Image direkt von GHCR zu beziehen:

```yaml
version: '3.8'

services:
  chrony:
    image: ghcr.io/jbkunama1/haichrony:latest
    container_name: hai-chrony
    restart: unless-stopped
    ports:
      - "123:123/udp"
      - "323:323/tcp"
    environment:
      - TZ=Europe/Berlin
    healthcheck:
      test: ["CMD", "chronyc", "tracking"]
      interval: 30s
      timeout: 10s
      retries: 3
```

---

## Umgebungsvariablen (Envs)

| Variable | Beschreibung | Standard |
|----------|--------------|----------|
| `TZ`     | Zeitzone für den Container | `Europe/Berlin` |
