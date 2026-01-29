# Tableaux de commandes Bash

## Fichiers et répertoires

| Action | Commande |
|--------|----------|
| Création ou ouverture d'un fichier | `code <nom_du_fichier>` |
| Affichage du répertoire courant | `pwd` |
| Affiche le contenu d'un fichier dans le terminal | `cat <nom_du_fichier>` |
| Nettoyage du terminal | `clear` |

## cd (Change Directory)

| Action | Commande |
|--------|----------|
| Aller dans le fichier/dossier ciblé | `cd <nom_du_dossier>` |
| Remonter dans l'arborescence (répertoire parent) | `cd ..` |
| Remonter au répertoire de l'utilisateur (home) | `cd ~` |

## ls (List)

| Action | Commande |
|--------|----------|
| Affiche les fichiers et dossiers du répertoire courant | `ls` |
| Affiche en ordre inverse | `ls -r` |
| Affiche avec les droits, dates, etc. | `ls -l` |
| Affiche les fichiers cachés (commençant par ".") | `ls -a` |

## mv (Move)

| Action | Commande |
|--------|----------|
| Renommer un fichier/dossier (avec confirmation si existe déjà) | `mv -i <fichier_à_renommer> <nouveau_nom>` |
| Déplacer un fichier du répertoire parent vers le répertoire courant | `mv ../<fichier_à_déplacer> ./` |

## cp (Copy)

| Action | Commande |
|--------|----------|
| Copie simple d'un fichier vers un dossier | `cp <fichier_à_copier> <dossier_de_destination>/` |
| Copie du contenu d'un dossier vers un autre | `cp <monDossier>/* <monDossier2>/` |

## rm (Remove)

| Action | Commande |
|--------|----------|
| Suppression d'un fichier | `rm <nom_du_fichier>` |
| Suppression de tous les fichiers se terminant par une extension/mot | `rm *<.extension>` |
| Suppression d'un dossier (récursif) | `rm -r <nom_du_dossier>/` |