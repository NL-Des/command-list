---
name: resolve-conception-issues
description: Reprend le dernier rapport de /verify-conception (ou en relance un) et résout les points relevés de façon interactive — une question à choix multiples par point ou groupe de points liés via AskUserQuestion, puis applique les corrections choisies dans references/.
---

# Résolution guidée des points de conception (Tracker Pro)

Ce skill transforme les points relevés par une inspection de cohérence (`/verify-conception`) en décisions concrètes prises par l'utilisateur, puis applique les corrections choisies dans `references/`.

## Étapes

1. **Obtenir le rapport de points à résoudre** :
   - S'il existe déjà un rapport de `verify-conception` dans la conversation en cours, le réutiliser tel quel.
   - Sinon, exécuter d'abord les étapes du skill `verify-conception` pour en produire un.

2. **Prioriser** : traiter en premier les points classés « incohérence avérée », puis « ambiguïté à trancher ». Les « suggestions » non bloquantes peuvent être groupées à la fin ou proposées comme optionnelles.

3. **Poser des questions à choix multiples** via `AskUserQuestion`, par lot de 1 à 4 questions maximum par appel :
   - Une question par point, ou par groupe de points étroitement liés (ex. plusieurs occurrences de la même incohérence à travers plusieurs fichiers).
   - Chaque question doit citer le texte exact du problème et les fichiers concernés, pour que l'utilisateur n'ait pas besoin de rouvrir le rapport.
   - Toujours proposer 2 à 4 options concrètes de résolution, dont systématiquement une option « laisser tel quel / je m'en occupe moi-même ».
   - Ne jamais présumer la réponse : si plusieurs résolutions sont plausibles, les présenter toutes plutôt que d'en recommander une seule sans alternative.

4. **Avant d'appliquer une correction textuelle répétée** (un renvoi cassé, une formulation à remplacer), **rechercher (grep) toutes les occurrences** du même renvoi/formulation dans le(s) fichier(s) concerné(s) — pas seulement la ligne citée dans le rapport source. Une incohérence de ce type apparaît rarement une seule fois : corriger uniquement la ligne citée, sans vérifier le reste du fichier, laisse fréquemment des résidus identiques ailleurs (constaté en pratique : un renvoi cassé vers un même fichier cible, présent à 3 endroits d'un même document, n'a été corrigé qu'à 1 endroit faute de cette recherche).

5. **Appliquer immédiatement** chaque correction choisie via `Edit` (jamais via réécriture complète sauf fichier nouveau), avant de poser le lot de questions suivant — ne pas accumuler toutes les décisions puis tout appliquer d'un coup, pour que l'utilisateur voie l'effet de ses choix au fur et à mesure.

6. **Terminer par un résumé** : liste des fichiers modifiés avec un résumé d'une ligne par changement, et liste des points explicitement laissés en l'état (avec la raison si donnée par l'utilisateur).

## Garde-fous

- Ne jamais appliquer de correction sans qu'elle ait été explicitement choisie par l'utilisateur via une question — ce skill ne devine pas la bonne résolution.
- Si le rapport source contient un point déjà classé « suggestion » et que l'utilisateur choisit de l'ignorer, ne pas le reproposer dans une future exécution sans qu'une nouvelle inspection ne le relève à nouveau.
- Rester dans le périmètre de `references/` : ce skill ne touche pas au code applicatif.
