#!/bin/bash

echo "Lancement du script d'installation des langages de développements et des technos."

# Golang
echo "Installation de Golang (ou dit GO)."
sudo apt install -y golang-go

    # Packages pour GO
    # Bcrypt aide à chiffrer les données.
    echo "Installation du package GO Bcrypt."
    go get golang.org/x/crypto/bcrypt

    # uuid est un package Google pour mieux générer des UUID(Universally Unique Identifiers).
    echo "Installation du package GO UUID."
    go get github.com/google/uuid

# NodeJS.
echo "Installation de Node JS."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

    # Chargement du npm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Installation depuis les données du npm
    nvm install --lts

# Python.
echo "Installation de Python."
sudo apt install -y python3-pip

# SQLite3.
echo "Installation de SQLite3."
sudo apt install -y sqlite3 libsqlite3-dev

# Docker et Docker Compose en format CLI.
echo "Installation de Docker et Docker Compose"
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
sudo usermod -aG docker $USER #Pour obtenir le droit d'utiliser les commande sans utiliser tout le temps sudo et devoir rentre notre mot de passe.