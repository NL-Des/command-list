#!/bin/bash
set -euo pipefail

echo "Lancement du script d'installation des langages de développements et des technos."

install_apt_if_missing() {
    local check_cmd="$1"; shift
    if command -v "$check_cmd" &>/dev/null; then
        echo "$check_cmd déjà installé, on passe."
    else
        sudo apt install -y "$@"
    fi
}

install_golang() {
    echo "Installation de Golang."
    install_apt_if_missing go golang-go

    echo "Préchargement des packages GO Bcrypt et UUID dans le cache des modules."
    local tmp_dir
    tmp_dir=$(mktemp -d)
    (cd "$tmp_dir" && go mod init warmup &>/dev/null && \
        go get golang.org/x/crypto/bcrypt github.com/google/uuid)
    rm -rf "$tmp_dir"
}

install_nodejs() {
    echo "Installation de Node JS."
    if [ -d "$HOME/.nvm" ]; then
        echo "NVM déjà installé, on passe."
    else
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    fi

    # Chargement du npm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Installation depuis les données du npm
    nvm install --lts
}

install_python() {
    echo "Installation de Python."
    install_apt_if_missing pip3 python3-pip
}

install_sqlite() {
    echo "Installation de SQLite3."
    install_apt_if_missing sqlite3 sqlite3 libsqlite3-dev
}

install_rust() {
    echo "Installation de Rust (via rustup)."
    if command -v rustc &>/dev/null; then
        echo "Rust déjà installé, on passe."
    else
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        # shellcheck disable=SC1091
        source "$HOME/.cargo/env"
    fi
    rustc --version
    cargo --version
}

install_docker() {
    echo "Installation de Docker et Docker Compose"
    if command -v docker &>/dev/null; then
        echo "Docker déjà installé, on passe."
        return
    fi

    sudo apt install ca-certificates curl gnupg -y
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo usermod -aG docker "$USER" #Pour obtenir le droit d'utiliser les commande sans utiliser tout le temps sudo et devoir rentre notre mot de passe.
}

sudo apt update

install_golang
install_nodejs
install_python
install_sqlite
install_rust
install_docker

echo "Installation terminée."
