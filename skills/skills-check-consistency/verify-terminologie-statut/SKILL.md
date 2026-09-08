---
name: verify-terminologie-statut
description: Vérifie la stabilité de la terminologie (CollectionPolicy, ExportPolicy, administrateur central, CollectedFact, etc.) et l'uniformité de la formulation des éléments « reportés »/« retirés de la conception active » à travers la conception Tracker Pro (references/). Produit un rapport structuré des points à corriger, sans modifier les fichiers. À utiliser après toute modification de references/, ou dans le cadre de /verify-conception.
---

# Vérification de la terminologie et du statut (Tracker Pro)

Ce skill inspecte en lecture seule la stabilité du vocabulaire et la cohérence des mentions de report dans `references/` et restitue un rapport structuré. Il ne modifie jamais de fichier.

## Étapes

1. **Lister l'état actuel** de `references/` (`ls references/` ou équivalent) pour travailler sur la liste réelle de fichiers, pas sur une liste figée.

2. **Lire en entier** (pas des extraits) tous les fichiers de `references/`, et vérifier :
   - La stabilité des noms (`CollectionPolicy`, `ExportPolicy`, `administrateur central`, `CollectedFact`, etc.) à travers tous les fichiers.
   - Une formulation uniforme pour tout ce qui est marqué « reporté »/« retiré de la conception active » (même date, même renvoi vers `questions_a_approfondir.md` et/ou `administrateur_central.md`).

3. **Pour chaque point relevé**, citer le texte exact du problème avec son fichier, et le classifier :
   - **Incohérence avérée** : deux fichiers se contredisent, ou un renvoi pointe vers du contenu inexistant.
   - **Ambiguïté à trancher** : le texte est cohérent mais laisse une question ouverte non documentée dans `questions_a_approfondir.md`.
   - **Suggestion** : amélioration de clarté, non bloquante.

4. **Présenter le rapport** à l'utilisateur (texte direct dans la réponse, pas de fichier créé sauf demande explicite). Si rien n'est trouvé, le dire explicitement plutôt que de forcer un résultat.

## Garde-fous

- Ce skill est en **lecture seule** : ne jamais éditer de fichier de `references/` (ni ailleurs) dans le cadre de ce skill.
- Ne pas re-signaler les points déjà explicitement traités comme « à approfondir plus tard » dans `questions_a_approfondir.md` — ce ne sont pas des oublis, sauf si une formulation incohérente sur *comment* ce report est exprimé est détectée.
