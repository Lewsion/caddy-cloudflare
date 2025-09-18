# Use official Caddy builder image to build custom Caddy with Cloudflare plugin
FROM caddy:2.10.2-builder-alpine AS builder

# Enable caching for Go modules and build cache
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
      --with github.com/caddy-dns/cloudflare
      --with github.com/WeidiDeng/caddy-cloudflare-ip

# Final lightweight runtime image
FROM caddy:2.10.2-alpine

# Copy the custom-built Caddy binary from builder
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
