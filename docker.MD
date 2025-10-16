## Pour lancer le container, sans immobiliser le terminal, et supprimer les dockers qui tournaient avant.
docker compose up -d --build --remove-orphans --force-recreate <nom du container>

## Pour entrer dans le terminal du container.
docker exec -ti <nom du container> bash

## Pour lister les container actifs.
docker ps

## Pour supprimer un container spécifique.
docker kill <nom du container>

## Pour observer en temps réel les container actifs.
watch docker ps

## Pour vérifier les réseaux existants.
docker network ls

## Création du réseau web.
docker network create web
