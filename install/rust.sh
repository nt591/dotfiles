#!/bin/bash

# install Rust with Rustup
# https://www.rustup.rs/

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup install stable
rustup install nightly

rustup default stable

# install RLS
packages=(
  clippy
  rls
  rust-analysis
  rust-src
  rustfmt
)

rustup component add "${packages[@]}"

