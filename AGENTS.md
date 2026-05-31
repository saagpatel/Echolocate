<!-- portfolio-context:start -->
# Portfolio Context

## What This Project Is

Echolocate is a Tauri desktop network-discovery and topology visualizer. A Rust backend performs local network scanning, ping/ARP discovery, port checks, and JSON session export while a SvelteKit frontend maps discovered devices and relationships.

## Current State

The repo is a work-in-progress desktop network tool. Core discovery and port scanning are functional on macOS; IPv6, custom alert rules, and cross-platform support are still not implemented. Existing untracked folders are generated artifacts, so this recovery pass should only add the context file.

## Stack

| Layer | Technology |
|-------|------------|
| Desktop shell | Tauri 2 |
| Backend | Rust (network scanning, socket access) |
| Frontend | SvelteKit (Svelte 5) |
| Storage | SQLite |

> **Status: Work in Progress** — Core discovery and port scanning are functional on macOS. IPv6, custom alert rules, and cross-platform support are not yet implemented.

## How To Run

```bash
git clone https://github.com/saagpatel/Echolocate.git
cd Echolocate
npm install
npm run tauri dev
```

## Known Risks

- Network scanning can be sensitive on real networks; keep scans local and operator-initiated.
- IPv6, custom alert rules, and cross-platform support are not yet implemented.
- Scan history is local SQLite state; avoid destructive resets unless explicitly requested.
- Generated `artifacts` and `test-results` folders are local outputs and should not be swept into source commits.

## Next Recommended Move

Add only the context file for this recovery pass, then continue with macOS discovery stability before expanding IPv6, alert rules, or cross-platform support.

<!-- portfolio-context:end -->
