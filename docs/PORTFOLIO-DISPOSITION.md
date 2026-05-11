# Echolocate — Portfolio Disposition

**Status:** Active — Tauri 2 + SvelteKit (Svelte 5) + Rust network
discovery / port scanner on `origin/master` with Phases 1-4 shipped
(scaffold, alerts + scan cancellation + hostname resolution, OS
fingerprinting + device classification + export/import + latency
charts + keyboard shortcuts). README explicitly says **"Work in
Progress — Core discovery and port scanning are functional on macOS.
IPv6, custom alert rules, and cross-platform support are not yet
implemented."** Disposition is **not** Release Frozen.

> Disposition uses strict `origin/master` verification.
> **Default branch is `master`, not `main`** — a new quirk for this
> session, distinct from the `main`-tracking traps elsewhere.

---

## Verification posture

This repo has only `origin` (`saagpatel/Echolocate`) — **no
`legacy-origin` remote**. Clean from a migration perspective.

But **default branch is `master`, not `main`** (verified via
`git ls-remote --symref origin HEAD`). All prior disposition rounds
this session assumed `main` was canonical; that assumption fails
here. Reactivation and any tooling that hardcodes `origin/main` will
silently see the wrong tree (or fail).

Specifically verified on `origin/master`:

- Tip: `c4c416f` chore: add initial CHANGELOG
- Substantive commits on `origin/master`:
  - `a5d2dfc` feat: implement Phase 3/4 — OS fingerprinting, device classification, export/import, latency charts, keyboard shortcuts
  - `330bdd3` feat: implement Phase 2 — alert integration, scan cancellation, monitoring loop, hostname resolution, device diffing
  - `09aa6e3` feat: implement Phase 1 — full project scaffold with Tauri 2 + SvelteKit + Svelte 5
- Tree on `origin/master` is a substantive Tauri 2 app:
  - `src-tauri/src/alerts/{engine,notifier,mod}.rs`
  - `src-tauri/src/commands/{alert,device,export,scan,settings,validate,mod}.rs`
  - `src-tauri/src/db/{migrations,mod}.rs`
  - `src-tauri/migrations/001_initial.sql`
- Release scaffolding: none yet (no `RELEASE-READINESS.md`,
  no `release-smoke.yml`)
- Default branch: **`master`** (not `main`)

---

## Current state in one paragraph

Echolocate is a Tauri 2 + SvelteKit (Svelte 5) + Rust desktop network
scanner. Per README and on-master commits: discovery + port scanning
functional on macOS, with alert engine, scan cancellation, monitoring
loop, hostname resolution, OS fingerprinting, device classification,
import/export, latency charts, and keyboard shortcuts. Storage in
SQLite (migrations + db module). Tauri 2 commands cover alert,
device, export, scan, settings, validate. The README explicitly
flags **IPv6, custom alert rules, and cross-platform support as not
yet implemented**.

For full detail see `README.md` on `origin/master`.

---

## Why "Active" instead of Release Frozen

- **Release Frozen** — wrong. README explicitly markets the product
  as Work In Progress with three named gaps (IPv6, custom alert
  rules, cross-platform). Don't sign and ship a product the operator
  hasn't called done.
- **Cold Storage / Archived** — wrong. The Phase 1-4 commits are
  real product work; this isn't abandoned.
- **Scaffold-stop** — close, but wrong. The product is substantively
  built, not just scaffolded.
- **Active (WIP)** — correct. Awaits operator product decisions
  (close the three named gaps, then signing) or a deliberate
  v1-scoping-down (declare macOS-only IPv4-only the v1 surface, then
  freeze).

This is **not** the signing cluster. Signing cluster members all
have product surfaces the operator considers complete-pending-signing.
Echolocate's gap list is shorter than "Active awaiting product
decision" rows like Conductor / SnippetLibrary / Chronomap, but the
gaps are operator-declared.

---

## Possible next moves (operator choice)

### Option 1 — Scope down to v1 and join signing cluster

Declare macOS-only / IPv4-only / no-custom-rules as the v1 surface.
Update README to remove the "Work In Progress" warning. Then:

1. Wire Apple signing
2. Cut v1.0.0
3. Document IPv6 / cross-platform / custom rules as v2 scope

Estimated effort: ~2 hours scoping + ~3 hours signing = ~5 hours.

### Option 2 — Close the named gaps before v1

Implement IPv6 + custom alert rules + at least one other platform
(Windows or Linux), then v1.0. Higher operator-time cost (~2 weeks
solo) but the v1 release matches the README's current ambition.

### Option 3 — Open-source as a "macOS network audit tool"

Polish README local-build path. Don't operator-host or sign. Single
audience: macOS power users who can `cargo install` and trust the
binary.

Estimated effort: ~1 hour.

### Option 4 — Park

Mark Active (parked). Discovery is captured, Phase 4 is shipped.
Resurface when operator has bandwidth.

Estimated effort: this PR.

---

## Recommendation (informational)

**Option 1 (scope down) is probably right** if the operator wants a
clean shipped product. The IPv6 / cross-platform gaps are real, but
"macOS-only IPv4 network scanner" is a coherent v1 — the existing
feature surface (alerts, OS fingerprinting, export, latency charts)
is already richer than typical macOS network scanners.

But operator-judgment. If the operator's audience expects IPv6 or
Windows from a network tool, Option 2 is the call.

---

## Portfolio operating system instructions

| Aspect | Posture |
|---|---|
| Portfolio status | `Active (WIP)` |
| Sub-category | Phase 1-4 shipped, operator-declared gaps remain |
| Next packet shape | "Decide between Option 1 / 2 / 3 / 4" |
| Review cadence | Resume normal cadence — this row needs decision-time |
| Resurface conditions | Operator picks an option |
| Do **not** auto-add to signing cluster | Until operator decides to declare v1-scope or close named gaps |
| Special concern | **Default branch is `master`, not `main`.** Any tooling assuming `origin/main` fails here. |

---

## Why this row has a "master not main" quirk

Most session repos default to `main` on canonical `origin`. Echolocate
defaults to `master`. The distinction matters for:

- **Tooling** — any `git fetch origin && git log origin/main` style
  command will fail or silently target the wrong tree.
- **Disposition scripts** — assumptions baked into the prior session
  rounds wouldn't have caught this trap automatically.
- **PR workflow** — base branch is `master`, not `main`. PRs must
  target `master` or be rebased.

Worth flagging in case other repos in the portfolio also default to
`master` and have been mis-analyzed.

---

## Reactivation procedure (for the next code session)

1. **Confirm default branch.** `git ls-remote --symref origin HEAD`
   should print `refs/heads/master`. Don't assume `main`.
2. `git fetch origin && git checkout -b master origin/master` if
   the local `master` is missing or stale.
3. Review the local stash (`r8-echolocate-stash`) — contains mods
   to perf workflows, AGENTS.md, README.md, openapi/, package.json,
   plus untracked artifacts/ and test-results/.
4. Re-read README's "Status: Work In Progress" callout — confirm
   IPv6 / cross-platform / custom alert rules are still the named
   gaps.
5. Delete stale `codex/*` and `claude/*` branches that pre-date the
   Phase 3/4 commit (`a5d2dfc`).
6. Re-run `pnpm install && pnpm tauri dev` to confirm toolchain.
7. **Pick scope-down vs gap-close (Option 1 vs 2) before any code.**

---

## Last known reference

| Field | Value |
|---|---|
| `origin/master` tip | `c4c416f` chore: add initial CHANGELOG |
| Last substantive commit | `a5d2dfc` feat: implement Phase 3/4 — OS fingerprinting, device classification, export/import, latency charts, keyboard shortcuts |
| **Default branch** | **`master` (not `main`)** |
| Build system | Tauri 2 + Rust + SvelteKit (Svelte 5) + SQLite |
| Phases shipped | 1 (scaffold), 2 (alerts/scan), 3/4 (OS fingerprinting + export + charts + shortcuts) |
| Operator-declared gaps | IPv6, custom alert rules, cross-platform support |
| Release scaffolding | **None on `origin/master`** |
| Build verification status | Untested in this pass |
| Blocker | Operator decision: scope-down to v1 vs close named gaps (Option 1/2/3/4) |
| Migration state | **No `legacy-origin` remote** — clean |
| Distinguishing feature | **`master` default branch** — fresh quirk shape; operator-declared WIP status keeps this Active not Release Frozen |
