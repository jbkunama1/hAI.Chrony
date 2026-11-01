<div align="center">
  <img src="https://img.shields.io/badge/hAI-Chrony-00BFFF?style=for-the-badge&logo=linux&logoColor=white" alt="Project Logo" width="120">
  
  # 🚀 hAI.ProjektName
  
  **Ein hochperformanter [ProjektTyp] mit [Hauptfunktion], optimiert für [Einsatzgebiet].**
  
  <br>
  
  ![CI/CD Status](https://img.shields.io/github/actions/workflow/status/jbkunama1/hAI.Chrony/docker-publish.yml?branch=main&style=for-the-badge&logo=github)
  ![Docker Image Size](https://img.shields.io/docker/image-size/jbkunama1/haichrony/latest?style=for-the-badge&logo=docker)
  ![License](https://img.shields.io/github/license/jbkunama1/hAI.Chrony?style=for-the-badge)
  
  <br><br>
  
  <details>
    <summary>📋 Inhaltsverzeichnis</summary>
    <ul>
      <li><a href="#-features">✨ Features</a></li>
      <li><a href="#-quick-start">⚡ Quick Start</a></li>
      <li><a href="#-konfiguration">⚙️ Konfiguration</a></li>
      <li><a href="#-deployment">🚀 Deployment</a></li>
      <li><a href="#-umgebungsvariablen">🌍 Umgebungsvariablen</a></li>
      <li><a href="#-monitoring">📊 Monitoring</a></li>
      <li><a href="#-troubleshooting">🔧 Troubleshooting</a></li>
    </ul>
  </details>
</div>

---

## ✨ Features

<div align="center">
  <table>
    <tr>
      <td><img src="https://img.shields.io/badge/✅-Feature_1-4CAF50?style=for-the-badge&logo=check" alt="Feature 1"></td>
      <td><strong>Kernfunktion 1:</strong> Kurze Beschreibung des Hauptfeatures</td>
    </tr>
    <tr>
      <td><img src="https://img.shields.io/badge/🚀-Feature_2-2196F3?style=for-the-badge&logo=rocket" alt="Feature 2"></td>
      <td><strong>Kernfunktion 2:</strong> Weitere wichtige Funktionalität</td>
    </tr>
    <tr>
      <td><img src="https://img.shields.io/badge/🛡️-Security-FF5722?style=for-the-badge&logo=shield" alt="Security"></td>
      <td><strong>Security:</strong> Features zur Absicherung</td>
    </tr>
  </table>
</div>

### 🔧 Technische Highlights

- **Technologie 1**: Beschreibung der genutzten Technologie
- **Technologie 2**: Implementierungsdetails
- **Skalierbarkeit**: Wie das System Skalierung handhabt
- **Performance**: Optimierungen und Benchmarks

---

## ⚡ Quick Start

### Docker (Empfohlen)

```bash
# Image herunterladen
docker pull ghcr.io/jbkunama1/hai-<projectname>:latest

# Container starten
docker run -d \
  --name hai-<projectname> \
  -p <port>:<port> \
  ghcr.io/jbkunama1/hai-<projectname>:latest
```

### Docker Compose

```yaml
version: '3.8'
services:
  <service-name>:
    image: ghcr.io/jbkunama1/hai-<projectname>:latest
    container_name: hai-<projectname>
    restart: unless-stopped
    ports:
      - "<port>:<port>"
    environment:
      - TZ=Europe/Berlin
```

---

## ⚙️ Konfiguration

### Environment Variablen

| Variable | Beschreibung | Default | Typ |
|----------|--------------|---------|-----|
| `CONFIG_VAR` | Beschreibung der Konfiguration | `default_value` | string |
| `ENABLE_FEATURE` | Feature aktivieren/deaktivieren | `true` | boolean |

### Beispiel-Konfigurationsdatei

```yaml
# config.yaml
feature:
  enabled: true
  settings:
    timeout: 30s
    retries: 3
```

---

## 🚀 Deployment

### Portainer Stack

```yaml
version: '3.8'
services:
  <service-name>:
    image: ghcr.io/jbkunama1/hai-<projectname>:latest
    container_name: hai-<projectname>
    restart: unless-stopped
    ports:
      - "<port>:<port>"
    environment:
      - TZ=Europe/Berlin
    healthcheck:
      test: ["CMD", "healthcheck", "command"]
      interval: 30s
      timeout: 10s
      retries: 3
```

---

## 🌍 Umgebungsvariablen

<div align="center">
  <img src="https://img.shields.io/badge/Environment-Variables-9C27B0?style=for-the-badge&logo=env" alt="Environment Variables">
</div>

| Variable | Beschreibung | Standardwert | Pflicht |
|----------|--------------|--------------|---------|
| `TZ` | Zeitzone für den Container | `Europe/Berlin` | ❌ |
| `LOG_LEVEL` | Logging-Level | `info` | ❌ |
| `ENABLE_SSL` | SSL/TLS aktivieren | `false` | ❌ |

---

## 📊 Monitoring

### Health Checks

```bash
# Container-Status prüfen
docker exec hai-<projectname> healthcheck command

# Logs anzeigen
docker logs hai-<projectname>
```

### Metriken

<div align="center">
  <img src="https://img.shields.io/badge/Metrics-Prometheus-F57C00?style=for-the-badge&logo=prometheus" alt="Metrics">
</div>

- **Port**: `<metrics_port>`
- **Format**: Prometheus
- **Pfad**: `/metrics`

---

## 🔧 Troubleshooting

### Häufige Probleme

#### Problem 1: Port ist belegt

```bash
# Port-Check
netstat -tuln | grep <port>

# Alternative Port zuweisen
docker run -p <alternative_port>:<container_port> ...
```

#### Problem 2: Container startet nicht

```bash
# Logs prüfen
docker logs hai-<projectname>

# Container Inspektion
docker inspect hai-<projectname>
```

---

<div align="center">
  <img src="https://img.shields.io/badge/Built%20with-❤️-FF1493?style=for-the-badge" alt="Built with love">
  
  <br>
  <strong>Made with ❤️ by jbkunama1</strong>
</div>