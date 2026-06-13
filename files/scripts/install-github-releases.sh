#!/usr/bin/env bash
#
# Installs binaries from GitHub releases (and a few other sources) into /usr/bin.
# All downloads are extracted into a temporary directory that is cleaned up on exit.

set -euo pipefail

WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT

# Fetches the latest release tag for a GitHub repo and strips the leading 'v'
# (e.g. "v1.2.3" → "1.2.3") since most asset filenames use the bare version.
get_version() {
    local repo=$1
    curl -sL "https://api.github.com/repos/${repo}/releases/latest" \
        | grep '"tag_name":' \
        | sed -E 's/.*"v?([^"]+)".*/\1/'
}

# Downloads a single pre-compiled binary, marks it executable, and moves it to /usr/bin.
install_binary() {
    local name=$1 url=$2
    local dir
    dir=$(mktemp -d -p "$WORKDIR")
    curl -sSL -o "$dir/$name" "$url"
    chmod +x "$dir/$name"
    mv "$dir/$name" /usr/bin/
}

# Downloads and extracts a tar.gz archive, then moves the binary to /usr/bin.
# archive_path is the path to the binary inside the extracted archive
# (e.g. "subdir/binary" or just "binary" if it sits at the root).
# dest is the name the binary will be installed as in /usr/bin.
install_tar() {
    local url=$1 archive_path=$2 dest=$3
    local dir
    dir=$(mktemp -d -p "$WORKDIR")
    curl -sSL -o "$dir/archive.tar.gz" "$url"
    tar -zxf "$dir/archive.tar.gz" -C "$dir"
    mv "$dir/$archive_path" /usr/bin/"$dest"
}

# Downloads and installs an RPM package.
install_rpm() {
    local url=$1
    local dir
    dir=$(mktemp -d -p "$WORKDIR")
    curl -sSL -o "$dir/package.rpm" "$url"
    rpm -i "$dir/package.rpm"
}

# ── raw binaries ──────────────────────────────────────────────────────────────
install_binary argocd      "https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64"
install_binary bombardier  "https://github.com/codesenberg/bombardier/releases/latest/download/bombardier-linux-amd64"
install_binary kind        "https://github.com/kubernetes-sigs/kind/releases/latest/download/kind-linux-amd64"
install_binary mirrord     "https://github.com/metalbear-co/mirrord/releases/latest/download/mirrord_linux_x86_64"
install_binary sshs        "https://github.com/quantumsheep/sshs/releases/latest/download/sshs-linux-amd64"
install_binary witr        "https://github.com/pranshuparmar/witr/releases/latest/download/witr-linux-amd64"

KUBECTL_VERSION=$(curl -sSL https://dl.k8s.io/release/stable.txt)
install_binary kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

# ── tar archives (static URLs, no version lookup) ─────────────────────────────
install_tar \
    "https://github.com/atuinsh/atuin/releases/latest/download/atuin-x86_64-unknown-linux-gnu.tar.gz" \
    "atuin-x86_64-unknown-linux-gnu/atuin" "atuin"

install_tar \
    "https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz" \
    "eza" "eza"

install_tar \
    "https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz" \
    "k9s" "k9s"

install_tar \
    "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz" \
    "krew-linux_amd64" "krew"

install_tar \
    "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz" \
    "zellij" "zellij"

install_tar \
    "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/paping/paping_1.5.5_x86-64_linux.tar.gz" \
    "paping" "paping"

# ── tar archives (require version lookup) ─────────────────────────────────────
V=$(get_version "caddyserver/caddy")
install_tar \
    "https://github.com/caddyserver/caddy/releases/download/v${V}/caddy_${V}_linux_amd64.tar.gz" \
    "caddy" "caddy"

V=$(get_version "digitalocean/doctl")
install_tar \
    "https://github.com/digitalocean/doctl/releases/download/v${V}/doctl-${V}-linux-amd64.tar.gz" \
    "doctl" "doctl"

V=$(get_version "charmbracelet/gum")
install_tar \
    "https://github.com/charmbracelet/gum/releases/download/v${V}/gum_${V}_Linux_x86_64.tar.gz" \
    "gum_${V}_Linux_x86_64/gum" "gum"

V=$(get_version "ahmetb/kubectx")
install_tar \
    "https://github.com/ahmetb/kubectx/releases/download/v${V}/kubectx_v${V}_linux_x86_64.tar.gz" \
    "kubectx" "kubectx"
install_tar \
    "https://github.com/ahmetb/kubectx/releases/download/v${V}/kubens_v${V}_linux_x86_64.tar.gz" \
    "kubens" "kubens"

V=$(get_version "thomasschafer/scooter")
install_tar \
    "https://github.com/thomasschafer/scooter/releases/download/v${V}/scooter-v${V}-x86_64-unknown-linux-musl.tar.gz" \
    "scooter" "scooter"

V=$(get_version "stern/stern")
install_tar \
    "https://github.com/stern/stern/releases/download/v${V}/stern_${V}_linux_amd64.tar.gz" \
    "stern" "stern"

V=$(get_version "tldr-pages/tlrc")
install_tar \
    "https://github.com/tldr-pages/tlrc/releases/download/v${V}/tlrc-v${V}-x86_64-unknown-linux-gnu.tar.gz" \
    "tldr" "tldr"

V=$(get_version "aquasecurity/trivy")
install_tar \
    "https://github.com/aquasecurity/trivy/releases/download/v${V}/trivy_${V}_Linux-64bit.tar.gz" \
    "trivy" "trivy"

V=$(get_version "jacek-kurlit/pik")
install_tar \
    "https://github.com/jacek-kurlit/pik/releases/download/${V}/pik-${V}-x86_64-unknown-linux-gnu.tar.gz" \
    "pik-${V}-x86_64-unknown-linux-gnu/pik" "pik"

V=$(get_version "domcyrus/rustnet")
install_tar \
    "https://github.com/domcyrus/rustnet/releases/download/v${V}/rustnet-v${V}-x86_64-unknown-linux-musl.tar.gz" \
    "rustnet-v${V}-x86_64-unknown-linux-musl/rustnet" "rustnet"

V=$(get_version "konradsz/igrep")
install_tar \
    "https://github.com/konradsz/igrep/releases/download/v${V}/igrep-v${V}-x86_64-unknown-linux-gnu.tar.gz" \
    "ig" "ig"

# ── RPM packages ──────────────────────────────────────────────────────────────
V=$(get_version "wagoodman/dive")
install_rpm "https://github.com/wagoodman/dive/releases/download/v${V}/dive_${V}_linux_amd64.rpm"

V=$(get_version "anchore/syft")
install_rpm "https://github.com/anchore/syft/releases/download/v${V}/syft_${V}_linux_amd64.rpm"

# ── post-install ──────────────────────────────────────────────────────────────
/usr/bin/zellij setup --dump-config > /usr/dotfiles/zellij/config.kdl
