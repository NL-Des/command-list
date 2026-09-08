---
name: verify-bdd
description: Vérifie la cohérence de la conception BDD de Tracker Pro (DB_local.md, DB_external.md, 5_data_exportation.md, format_pivot.md, Architecture.md) — moteurs choisis, statut du schéma détaillé, rôle de DB_local. Produit un rapport structuré des points à corriger, sans modifier les fichiers. À utiliser après toute modification de la conception BDD, ou dans le cadre de /verify-conception.
---

# Vérification de la cohérence BDD (Tracker Pro)

Ce skill inspecte en lecture seule la conception de la persistance (bases locale et externe) dans `references/` et restitue un rapport structuré. Il ne modifie jamais de fichier.

## Étapes

1. **Lister l'état actuel** de `references/` (`ls references/` ou équivalent) pour travailler sur la liste réelle de fichiers, pas sur une liste figée.

2. **Lire en entier** (pas des extraits) `DB_local.md`, `DB_external.md`, `5_data_exportation.md`, `format_pivot.md` et `Architecture.md`, et vérifier :
   - La cohérence des moteurs choisis (SQLite/Postgres) entre ces fichiers.
   - Le statut « reporté » du schéma détaillé — s'il est bien marqué comme tel partout où il est mentionné, sans contradiction.
   - Une formulation uniforme de ce report d'un fichier à l'autre.
   - Le rôle de `DB_local` — une destination d'export parmi d'autres, jamais présentée comme un buffer obligatoire du pipeline.

3. **Pour chaque point relevé**, citer le texte exact du problème avec son fichier, et le classifier :
   - **Incohérence avérée** : deux fichiers se contredisent, ou un renvoi pointe vers du contenu inexistant.
   - **Ambiguïté à trancher** : le texte est cohérent mais laisse une question ouverte non documentée dans `questions_a_approfondir.md`.
   - **Suggestion** : amélioration de clarté, non bloquante.

4. **Présenter le rapport** à l'utilisateur (texte direct dans la réponse, pas de fichier créé sauf demande explicite). Si rien n'est trouvé, le dire explicitement plutôt que de forcer un résultat.

## Garde-fous

- Ce skill est en **lecture seule** : ne jamais éditer de fichier de `references/` (ni ailleurs) dans le cadre de ce skill.
- Ne pas re-signaler les points déjà explicitement traités comme « à approfondir plus tard » dans `questions_a_approfondir.md` — ce ne sont pas des oublis, sauf si une formulation incohérente sur *comment* ce report est exprimé est détectée.
