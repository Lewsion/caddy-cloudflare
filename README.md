# Caddy Cloudflare Docker Image

![Build Status](https://github.com/Lewsion/caddy-cloudflare/actions/workflows/build-and-push.yml/badge.svg)
![Dependabot](https://img.shields.io/badge/dependabot-enabled-brightgreen?logo=dependabot)
[![GHCR](https://img.shields.io/badge/GHCR-caddy--cloudflare-blue?logo=github)](https://ghcr.io/lewsion/caddy-cloudflare)
![License](https://img.shields.io/github/license/Lewsion/caddy-cloudflare?logo=open-source-initiative)
![Platforms](https://img.shields.io/badge/platforms-amd64%20%7C%20arm64-blue?logo=linux)
![Contributions welcome](https://img.shields.io/badge/contributions-welcome-orange?logo=github)


---

## Overview

This repository provides a **pre-built Caddy Docker image** with **Cloudflare DNS plugin** included. It is designed to make SSL certificate automation and reverse proxy setup **fast, reliable, and reproducible**.

Key goals:

- Automatic SSL/TLS using Let's Encrypt
- Cloudflare DNS integration for ACME challenges
- Prebuilt Docker image for ARM64 and x86_64 architectures
- Open for contributions to improve features, workflows, and Docker setup

---

## Features

- **Automatic HTTPS**: Caddy automatically provisions and renews SSL certificates.
- **Cloudflare DNS integration**: Use Cloudflare API to complete DNS-01 challenges automatically.
- **Prebuilt Docker image**: No need to manually compile Caddy with the Cloudflare plugin.
- **ARM64 support**: Works seamlessly on Oracle Ampere, Raspberry Pi, and other ARM64 devices.
- **Self-hosted CI/CD**: Built with GitHub Actions, cached for faster builds.
- **Open Contribution**: Contributions are welcome via PRs.

---

## Docker Compose Usage

The recommended way to run the container is via Docker Compose:

```yaml
services:
  caddy:
    image: ghcr.io/lewsion/caddy-cloudflare:latest
    container_name: caddy-cloudflare
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "2019:2019"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - caddy_data:/data
      - caddy_config:/config
    environment:
      - CLOUDFLARE_API_TOKEN=${CLOUDFLARE_API_TOKEN}

volumes:
  data:
  config:
````

---

## Environment Variables

You can provide environment variables in a `.env` file (e.g., `env.example`) to configure Caddy:

```env
# Cloudflare API Token for DNS challenges
# Get this from: https://dash.cloudflare.com/profile/api-tokens
# Required permissions: Zone:Zone:Read, Zone:DNS:Edit
CLOUDFLARE_API_TOKEN=your_cloudflare_api_token_here
```

> Tip: Copy `env.example` to `.env` and set your values. Docker Compose will automatically pick them up.

---

## Caddyfile Example

A basic Caddyfile to get started:

```text
trusted_proxies cloudflare {
    interval 12h
    timeout 15s
}
yourdomain.com {
    tls {
        dns cloudflare
    }
    reverse_proxy localhost:8080
}
```

* Replace `yourdomain.com` with your domain.
* Ensure `CLOUDFLARE_API_TOKEN` is set in your environment for DNS-01 challenge automation.

---

## Pulling the Docker Image

```bash
docker pull ghcr.io/lewsion/caddy-cloudflare:latest
```

* **latest**: Always points to the latest stable build.
* **SHA tags**: Immutable versions for reproducibility (`ghcr.io/lewsion/caddy-cloudflare:<commit-sha>`).

---

## Contributing

Contributions are always welcome! You can help by:

* Fixing bugs or typos
* Improving the Dockerfile or workflows
* Adding features or plugins
* Enhancing documentation

Steps to contribute:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/awesome-feature`.
3. Make your changes.
4. Submit a pull request to the `main` branch.

Please ensure your contributions follow the **workflow, Docker build practices, and coding standards** of this repository.

---

## CI/CD & Dependabot

* GitHub Actions automatically builds and pushes Docker images to GHCR.
* Dependabot keeps Docker base images and GitHub Actions up-to-date.
* Builds are cached for speed, tested on **ARM64 and x86\_64** architectures.

---

## License

MIT License – free to use, modify, and distribute.

---

> Maintained by **Lewsion**
