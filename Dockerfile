# Use a lightweight base image with Ubuntu 20.04 as the base image
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies for Rust and Solana binaries
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    bash \
    libc6 \
    libstdc++6 \
    libssl-dev \
    libclang-dev \
    libprotobuf-dev \
    pkg-config \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy both architecture-specific Solana test validator binaries into the container
COPY solana-test-validator-linux-arm64 /solana-test-validator-linux-arm64
COPY solana-test-validator-linux-amd64 /solana-test-validator-linux-amd64

# Make the binaries executable
RUN chmod +x /solana-test-validator-linux-arm64 /solana-test-validator-linux-amd64

# Detect architecture and run the appropriate binary
CMD /bin/sh -c 'if [ "$(uname -m)" = "aarch64" ]; then \
    echo "Detected ARM64 architecture. Running ARM64 binary."; \
    /solana-test-validator-linux-arm64; \
  elif [ "$(uname -m)" = "x86_64" ]; then \
    echo "Detected AMD64 architecture. Running AMD64 binary."; \
    /solana-test-validator-linux-amd64; \
  else \
    echo "Unsupported architecture: $(uname -m)"; \
    exit 1; \
  fi'
