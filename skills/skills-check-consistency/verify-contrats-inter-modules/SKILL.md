---
name: verify-contrats-inter-modules
description: Vérifie que les contrats entre étapes consécutives du pipeline Tracker Pro (0_initial_state → 1_data_collection_choice → 2_data_to_collect → 3_data_collector → 4_data_choice_exportation → 5_data_exportation) sont structurellement cohérents. Produit un rapport structuré des points à corriger, sans modifier les fichiers. À utiliser après toute modification du pipeline, ou dans le cadre de /verify-conception.
---

# Vérification des contrats inter-modules (Tracker Pro)

Ce skill inspecte en lecture seule la cohérence structurelle entre étapes consécutives du pipeline dans `references/` et restitue un rapport structuré. Il ne modifie jamais de fichier.

## Étapes

1. **Lister l'état actuel** de `references/` (`ls references/` ou équivalent) pour travailler sur la liste réelle de fichiers, pas sur une liste figée.

2. **Lire en entier** (pas des extraits) `0_initial_state.md`, `1_data_collection_choice.md`, `2_data_to_collect.md`, `3_data_collector.md`, `4_data_choice_exportation.md` et `5_data_exportation.md`. Pour chaque paire de fichiers consécutifs du pipeline, vérifier que la section « Sortie vers X » (ou équivalent) de l'un correspond bien, structurellement, à la section « Contrat d'entrée » / aux structures Rust attendues par le fichier suivant.

3. **Pour chaque point relevé**, citer le texte exact du problème avec son fichier, et le classifier :
   - **Incohérence avérée** : deux fichiers se contredisent, ou un renvoi pointe vers du contenu inexistant.
   - **Ambiguïté à trancher** : le texte est cohérent mais laisse une question ouverte non documentée dans `questions_a_approfondir.md`.
   - **Suggestion** : amélioration de clarté, non bloquante.

4. **Présenter le rapport** à l'utilisateur (texte direct dans la réponse, pas de fichier créé sauf demande explicite). Si rien n'est trouvé, le dire explicitement plutôt que de forcer un résultat.

## Garde-fous

- Ce skill est en **lecture seule** : ne jamais éditer de fichier de `references/` (ni ailleurs) dans le cadre de ce skill.
- Ne pas re-signaler les points déjà explicitement traités comme « à approfondir plus tard » dans `questions_a_approfondir.md` — ce ne sont pas des oublis, sauf si une formulation incohérente sur *comment* ce report est exprimé est détectée.
