

<p align="center">
    <img src="https://caddyserver.com/resources/images/caddy-circle.svg" width="100" alt="Caddy Logo" />
</p>

# Caddy + Cloudflare DNS: Simple, Reliable Docker Image

[![Build & Publish](https://github.com/Lewsion/caddy-cloudflare/actions/workflows/build.yml/badge.svg)](https://github.com/Lewsion/caddy-cloudflare/actions/workflows/build.yml)

![CI](https://github.com/endrence3/caddy-cloudflare/actions/workflows/build.yml/badge.svg)

This repository provides a production-ready Docker setup for the Caddy web server, pre-built with the Cloudflare DNS plugin for seamless Let's Encrypt SSL certificate automation using DNS-01 challenges.


## Features

- 🔒 Automatic SSL certificates via Let's Encrypt (DNS-01 with Cloudflare)
- ☁️ Cloudflare DNS plugin included by default
- � Caddyfile config validation in CI/CD
- �🚀 Automated builds & provenance with GitHub Actions
- 📦 Images published to GitHub Container Registry (GHCR)
## Quick Start
### Prerequisites

1. A Cloudflare account with your domain configured
   export CLOUDFLARE_API_TOKEN="your-cloudflare-api-token"
   ```
<p align="center">
  <img src="https://caddyserver.com/resources/images/caddy-circle.svg" width="100" alt="Caddy Logo" />
</p>

# Caddy Reverse Proxy with Cloudflare DNS (ACME) Support

[![Build & Publish](https://github.com/Lewsion/caddy-cloudflare/actions/workflows/build.yml/badge.svg)](https://github.com/Lewsion/caddy-cloudflare/actions/workflows/build.yml)

## Configuration

### Cloudflare API Token

2. Click "Create Token"
3. Use the "Custom token" template with these permissions:
   - Zone:Zone:Read
   - Zone:DNS:Edit
4. Include your specific zone in "Zone Resources"

### Caddyfile Examples
```caddyfile
    email your-email@example.com
    acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
}
```
#### Reverse Proxy
```caddyfile
{
    email your-email@example.com
    acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
}
api.your-domain.com {
    reverse_proxy backend:8080
}
```

#### Multiple Domains with Redirect
```caddyfile
{
    email your-email@example.com
    acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
}

www.your-domain.com {
    redir https://your-domain.com{uri} permanent
}

your-domain.com {
    root * /srv
    file_server
}

## Development

docker build -t caddy-cloudflare .

### Testing

```bash
# Start the container
docker-compose up -d

docker-compose logs -f caddy

# Test configuration


## CI/CD & Docker Workflow
This repository uses a robust GitHub Actions workflow to ensure quality and security:

- **Multi-architecture builds**: Images for `linux/amd64` and `linux/arm64`.
- **Caddyfile validation**: Every build validates your Caddyfile before publishing.
- **Automated tagging**: Images are tagged by branch, PR, and version.
- **Provenance/attestation**: Supply chain security with build provenance.
- **Fast builds**: Build cache enabled for quick CI/CD.

### Available Image Tags

- `latest` – Latest build from `main`
- `vX.Y.Z` – Version tags (e.g., `v1.0.0`)
- `main` – Latest commit from `main` branch


## Security

- Runs as non-root user (`caddy:caddy`)
- Security headers enabled by default
- Uses official Caddy base images
- Supports automatic security updates via Dependabot

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `CLOUDFLARE_API_TOKEN` | Cloudflare API token for DNS challenges | Yes |

*Email can also be set in the Caddyfile

|------|-------------|
| `/srv` | Web root directory |
| `/data` | Caddy data (certificates, etc.) |
| `/config` | Caddy configuration cache |

## Ports
| Port | Description |
|------|-------------|
| 80 | HTTP |
| 2019 | Admin API (optional) |
## Troubleshooting

### Certificate Issues

1. **Check DNS propagation:**
   ```bash
   dig TXT _acme-challenge.your-domain.com
   ```

2. **Verify Cloudflare token:**
   ```bash
   curl -X GET "https://api.cloudflare.com/client/v4/user/tokens/verify" \
        -H "Authorization: Bearer YOUR_TOKEN"
   ```

3. **Check Caddy logs:**
   ```bash
   docker logs caddy-cloudflare
   ```

### Common Issues

- **Permission denied**: Ensure proper file permissions for volumes
- **DNS challenge fails**: Verify API token permissions and domain ownership
- **Port conflicts**: Check if ports 80/443 are already in use

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


## Support & Resources

- 📖 [Caddy Documentation](https://caddyserver.com/docs/)
- 🔌 [Cloudflare DNS Plugin](https://github.com/caddy-dns/cloudflare)
- 🐛 [Report Issues](https://github.com/endrence3/caddy-cloudflare/issues)


## Acknowledgments

- [Caddy Server](https://caddyserver.com/) team for the excellent web server
- [Cloudflare](https://cloudflare.com/) for DNS services
- Contributors to the Caddy Cloudflare DNS plugin