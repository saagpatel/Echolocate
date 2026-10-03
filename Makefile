.PHONY: build test lint clean check run

build:
	cargo build --manifest-path src-tauri/Cargo.toml --locked --release

check:
	cargo check --manifest-path src-tauri/Cargo.toml --locked

test:
	cargo test --manifest-path src-tauri/Cargo.toml --locked --lib

lint:
	cargo clippy --manifest-path src-tauri/Cargo.toml --locked -- -D warnings

run:
	cargo run --manifest-path src-tauri/Cargo.toml --locked

clean:
	cargo clean --manifest-path src-tauri/Cargo.toml
