# Solana-anchor-react
Solana x Anchor x React in Docker.

## Enviornment
- ubuntu 24.04
- Rust latest
- Solana CLI v 2.1.17
- Node latest
- npm latest
- Anchor CLI latest
- React latest

## Note:
Ubuntu 24.04 was used to meet the Anchor GLIBC 2.39 requirement

## Notice
Please version up to latest all. Especially Solana CLI.
[Install the Solana Tool Suite](https://docs.solana.com/cli/install-solana-cli-tools)

## Run Docker
1. Download this and move to download directory.

2. Run Docker. Make sure you are running Docker Desktop before this.
```
docker compose up -d --build
```

3. Check running App in Docker Desktop.

## Connecting to Docker
Get Docker NAME.
```
docker ps
```
NAME                                    COMMAND             SERVICE             STATUS              PORTS
solana-anchor-react-app-1               "bash"              app                 running             0.0.0.0:3000->3000/tcp

If you get "no configuration file provided: not found" error, you are in the wrong directory. You need to be in download directory.

Connecting to Docker.
% docker exec -it [NAME] bash
```
docker container exec -it solana-anchor-react-app-1 bash
```
