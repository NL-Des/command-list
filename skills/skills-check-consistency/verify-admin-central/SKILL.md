---
name: verify-admin-central
description: Vérifie la cohérence du rôle et du périmètre reporté de l'administrateur central de Tracker Pro à travers description_projet.md, 1_data_collection_choice.md, 4_data_choice_exportation.md, chiffrement.md, administrateur_central.md, 0_initial_state.md. Produit un rapport structuré des points à corriger, sans modifier les fichiers. À utiliser après toute modification touchant l'administrateur central, ou dans le cadre de /verify-conception.
---

# Vérification de la cohérence admin central (Tracker Pro)

Ce skill inspecte en lecture seule la conception du rôle de l'administrateur central dans `references/` et restitue un rapport structuré. Il ne modifie jamais de fichier.

## Étapes

1. **Lister l'état actuel** de `references/` (`ls references/` ou équivalent) pour travailler sur la liste réelle de fichiers, pas sur une liste figée.

2. **Lire en entier** (pas des extraits) `description_projet.md`, `1_data_collection_choice.md`, `4_data_choice_exportation.md`, `chiffrement.md`, `administrateur_central.md` et `0_initial_state.md`, et vérifier :
   - La cohérence du rôle et du périmètre (reporté à l'implémentation) de l'administrateur central entre ces fichiers.
   - Que `CollectionPolicy` et `ExportPolicy` sont toujours attribuées à l'administrateur central, jamais à l'utilisateur local.
   - Que tout endroit mentionnant enrôlement, OTP ou installeur renvoie bien vers `administrateur_central.md`.

3. **Pour chaque point relevé**, citer le texte exact du problème avec son fichier, et le classifier :
   - **Incohérence avérée** : deux fichiers se contredisent, ou un renvoi pointe vers du contenu inexistant.
   - **Ambiguïté à trancher** : le texte est cohérent mais laisse une question ouverte non documentée dans `questions_a_approfondir.md`.
   - **Suggestion** : amélioration de clarté, non bloquante.

4. **Présenter le rapport** à l'utilisateur (texte direct dans la réponse, pas de fichier créé sauf demande explicite). Si rien n'est trouvé, le dire explicitement plutôt que de forcer un résultat.

## Garde-fous

- Ce skill est en **lecture seule** : ne jamais éditer de fichier de `references/` (ni ailleurs) dans le cadre de ce skill.
- Ne pas re-signaler les points déjà explicitement traités comme « à approfondir plus tard » dans `questions_a_approfondir.md` — ce ne sont pas des oublis, sauf si une formulation incohérente sur *comment* ce report est exprimé est détectée.
