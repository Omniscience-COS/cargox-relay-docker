# README.md for CargoX Relay Docker Deployment

## Overview
This README provides documentation for deploying the CargoX Relay application using Kubernetes and Docker. The application has been containerized and is available as a Docker image. This guide covers the deployment process using the provided `deploy-relay.yaml` Kubernetes configuration file and also includes instructions for running the Docker image directly.

**Note**: This deployment is a modification of the original `cargox-holding/cxo-relay` project.

## Prerequisites
- A working Kubernetes cluster (for Kubernetes deployment)
- Docker installed and configured
- Access to the Docker image: `omniscienceuk/cargox-relay-amd64:latest`

## Deployment Steps
1. **Clone the Repository**
    Clone the `Omniscience-COS/cargox-relay-docker` repository, which contains necessary code and configuration files for the CargoX Relay application.

    ```bash
    git clone https://github.com/Omniscience-COS/cargox-relay-docker.git
    cd cargox-relay-docker
    ```

2. **Pull Docker Image**
    Pull the Docker image from the Docker Hub:

    ```bash
    docker pull omniscienceuk/cargox-relay-amd64:latest
    ```

3. **Deploy Using Kubernetes**
    Deploy the application to your Kubernetes cluster using the `deploy-relay.yaml` file.

    ```bash
    kubectl apply -f deploy-relay.yaml
    ```

4. **Configure Environment Variables**
    You must provide specific environment variables (private key, RPC URL, etc.) for the application to function correctly. Replace the placeholders in the deployment YAML file with actual values:

    - `<<PRIVATE_KEY_OF_MATIC_GAS_WALLET>>`: The private key of the MATIC gas wallet.
    - `<<POLYGON_MAINNET_RPC_URL>>`: The RPC URL for the Polygon Mainnet.
    - `<<PUBLIC_ADDR_THAT_HOLDS_CARGOX_FOR_REWARDS>>`: The public address that holds CargoX for rewards.

5. **Verify Deployment**
    After deployment, verify that the application is running correctly:

    ```bash
    kubectl get pods -l app=cargox-relay
    ```

## Running Docker Image Directly
If you prefer to run the application directly using Docker, you can do so using the `docker run` command. Ensure you replace the placeholders with actual values.

```bash
docker run -d \
  --name cargox-relay \
  omniscienceuk/cargox-relay-amd64:latest \
  --key "<<PRIVATE_KEY_OF_MATIC_GAS_WALLET>>" \
  --relayUrl "https://cargox.digital/api/v3/relay/" \
  --rpcUrl "<<POLYGON_MAINNET_RPC_URL>>" \
  --rewardAddr "<<PUBLIC_ADDR_THAT_HOLDS_CARGOX_FOR_REWARDS>>" \
  --gascap "500"
```


You can also add additional flags such as `--doffa` or `--gas` as needed.

## Configuration Options
- **Image Pull Policy:** Set to `Always` by default. Change it to `IfNotPresent` if you prefer using a locally cached image.
- **Resources:** Uncomment and adjust the `limits` and `requests` fields to set memory and CPU limits and requests as required.
- **Security Context:** Uncomment and configure the `securityContext` for running the container with specific user/group IDs.
- **Additional Flags:** Uncomment additional flags like `--doffa` and `--gas` if required.

## Troubleshooting
If you encounter issues, check the logs of the deployed pod or Docker container:

For Kubernetes:

```bash
kubectl logs -l app=cargox-relay
```
Or for Docker:

```bash
docker logs cargox-relay
```

Contributing
For contributing to the Omniscience-COS/cargox-relay-docker project, please refer to the repository's contribution guidelines.

This README is intended to guide users in deploying the CargoX Relay application on a Kubernetes cluster and running it directly using Docker. For further assistance or feedback, please open an issue in the GitHub repository.





# FORKED FROM CXO Relay

This is the official CXO relay app.

## Installing dependencies

To install dependencies just run

```
yarn
```

## Running the development server

```
yarn dev
```

## Building the project

```
yarn build
electron-builder
```

# CXO Relay CLI

You can use the CXO relay also via its CLI

## Prerequisites

You need [node and npm](https://nodejs.org/en/download/) to run the CLI. We recommend using the latest node version or at least v14.18.0.

## Installation

Install the latest cxo-relay version using npm

```
npm i -g cxo-relay
```

Example execution

```
cxo-relay --key "this is an example mnemonic or private key" --relayUrl http://example/relay --rpcUrl http://example/rpc --rewardAddr 0x1000000000000000000000000000000000000001
```

To install from source, clone the repository and run

```
cd cxo-relay/
yarn build-cli
yarn add global file:$PWD
```
