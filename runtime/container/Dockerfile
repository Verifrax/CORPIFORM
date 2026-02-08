# CORPIFORM RUNTIME CONTAINER
# Deterministic, minimal, non-authoritative execution environment

FROM alpine:3.19

# Fail fast
SHELL ["/bin/sh", "-euo", "pipefail", "-c"]

# Install required runtime dependencies only
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    openssl \
    ca-certificates \
    coreutils \
    util-linux \
    openssh-client \
    kubectl

# Create non-root execution user
RUN addgroup -S corpiform && adduser -S corpiform -G corpiform

WORKDIR /corpiform

# Copy source
COPY . /corpiform

# Enforce permissions
RUN chmod -R 755 /corpiform && \
    chmod +x /corpiform/**/**/*.sh || true

USER corpiform

# No default command
ENTRYPOINT ["/corpiform/runtime/container/entrypoint.sh"]
