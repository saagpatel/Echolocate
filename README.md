# Echolocate

[![Rust](https://img.shields.io/badge/Rust-%23dea584?style=flat-square&logo=rust)](#) [![Status](https://img.shields.io/badge/status-WIP-yellow?style=flat-square)](#)

> Desktop network discovery and topology visualizer.

Echolocate scans your local network, discovers connected devices, and maps the topology. Built with a Rust backend for native packet access and a SvelteKit frontend for the visual layer.

## Features

- **Live discovery** — ARP and ping sweeps across local subnets
- **Port scanning** — Top 100 common ports per host
- **Topology view** — Visual map of discovered devices and their relationships
- **Session export** — Save and restore device and alert data as JSON
- **Local storage** — All scan history persisted in SQLite, nothing leaves the machine

## Quick Start

Use Node.js 22.12+ with npm, Rust/Cargo, and the platform's Tauri 2 native build
prerequisites (Xcode Command Line Tools on macOS; platform libraries are also
required on Linux/Windows). Run the following commands from the repository root.


```bash
git clone https://github.com/saagpatel/Echolocate.git
cd Echolocate
npm ci
npm run tauri dev
```

## Verification without scanning

```sh
npm ci
npm run check   # Svelte/TypeScript diagnostics
npm run build   # static frontend build, also needed before a release Rust build
make check      # locked Rust compile check in src-tauri
cargo test --manifest-path src-tauri/Cargo.toml --locked --lib commands::validate::tests::
make test       # broader locked Rust library tests
```

The Makefile selects `src-tauri/Cargo.toml`; there is no Cargo workspace at the
repository root. `make build` compiles the release Rust target after the frontend
build. There is no frontend unit/browser test runner configured. Rust tests are embedded
in the library modules (validation, database, network-data parsing and scanner
logic); the focused command above runs input-validation fixtures. These unit
tests do not establish real-network or desktop-runtime coverage. `make lint` runs strict Clippy with `-D warnings`; current Rust unused/dead
code warnings fail that lane and must not be suppressed to claim a pass. No separate
frontend formatter/lint script is configured.

These compile/check commands do not launch the desktop app or scan a network.
For frontend layout changes, `npm run dev` can preview the UI in a browser, but
Tauri IPC/device operations require the desktop shell and are not browser proof.
For desktop/scan changes, use a separate disposable local session and synthetic
or explicitly authorized network targets. `npm run tauri dev`/`make run` launch
runtime code, create app-local database state, and can scan when an operator starts
a scan; they are not the routine verification gate. Preserve existing scan history
and generated `src-tauri/gen` outputs. No automated visual suite is configured.

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