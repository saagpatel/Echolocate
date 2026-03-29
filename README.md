# Echolocate

[![Rust](https://img.shields.io/badge/Rust-%23dea584?style=flat-square&logo=rust)](#) [![Status](https://img.shields.io/badge/status-WIP-yellow?style=flat-square)](#)

> Desktop network discovery and topology visualizer.

Echolocate scans your local network, discovers connected devices, and maps the topology. Built with a Rust backend for native packet access and a SvelteKit frontend for the visual layer.

## Features

- **Live discovery** — ARP and ping sweeps across local subnets
- **Port scanning** — Top 100 common ports per host
- **Topology view** — Visual map of discovered devices and their relationships
- **PCAP export** — Save session captures for offline analysis
- **Local storage** — All scan history persisted in SQLite, nothing leaves the machine

## Quick Start

```bash
git clone https://github.com/saagpatel/Echolocate.git
cd Echolocate
npm install
npm run tauri dev
```

## Tech Stack

| Layer | Technology |
|-------|------------|
| Desktop shell | Tauri 2 |
| Backend | Rust (network scanning, socket access) |
| Frontend | SvelteKit (Svelte 5) |
| Storage | SQLite |

> **Status: Work in Progress** — Core discovery and port scanning are functional on macOS. IPv6, custom alert rules, and cross-platform support are not yet implemented.

## License

MIT