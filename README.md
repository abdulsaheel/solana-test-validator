# Solana Test Validator Docker

This Docker repository provides a containerized solution to run the Solana test validator, automatically detecting the architecture of the host machine and running the appropriate binary. The container includes both the ARM64 and AMD64 versions of the Solana test validator (`solana-test-validator-linux-arm64` and `solana-test-validator-linux-amd64`), allowing it to work on different machine architectures.

## Features

- Automatically detects the host machine architecture (ARM64 or AMD64).
- Runs the appropriate Solana test validator binary for the detected architecture.
- Simple Docker setup with no external dependencies required.

## Architecture Support

- **ARM64**: Runs the `solana-test-validator-linux-arm64` binary on ARM-based 64-bit architectures.
- **AMD64**: Runs the `solana-test-validator-linux-amd64` binary on Intel/AMD 64-bit architectures.

## Prerequisites

- Docker installed on your machine.

## Getting Started

### Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/catalogfi/solana-test-validator-docker.git
cd solana-test-validator-docker
```

### Build the Docker Image

To build the Docker image from the repository, run the following command:

```bash
docker build -t solana-test-validator .
```

This will create a Docker image named `solana-test-validator`.

### Run the Docker Container

To run the container, simply execute:

```bash
docker run --rm solana-test-validator
```

The container will automatically detect the architecture of your machine and run the appropriate Solana test validator binary.

### Supported Architectures

- **ARM64**: If your machine is running on an ARM-based 64-bit architecture (e.g., certain Raspberry Pi models, Apple M1/M2 chips, etc.), the ARM64 binary will be executed.
- **AMD64**: If your machine is running on an Intel or AMD 64-bit architecture (e.g., most desktop and server systems), the AMD64 binary will be executed.

### Custom Architecture

If you wish to build for a specific architecture manually (e.g., for cross-building), you can specify the `--platform` flag when running the Docker container:

For AMD64 (Intel/AMD 64-bit):
```bash
docker run --rm --platform linux/amd64 solana-test-validator
```

For ARM64 (ARM 64-bit):
```bash
docker run --rm --platform linux/arm64 solana-test-validator
```

## How It Works

1. The Docker container contains two Solana test validator binaries: `solana-test-validator-linux-arm64` and `solana-test-validator-linux-amd64`.
2. When the container is run, it checks the architecture of the host machine using the `uname -m` command.
3. Based on the detected architecture, the appropriate binary is executed.
4. If the architecture is not supported, the container will exit with an error message.

## Customizing the Dockerfile

You can modify the `Dockerfile` to include additional binaries or dependencies if needed.

- Add more binaries by copying them into the Docker image in the `COPY` command.
- Modify the architecture detection logic if you need to support additional architectures.
#   s o l a n a - t e s t - v a l i d a t o r  
 