---
name: verify-liens-arborescence
description: Vérifie les liens Markdown et l'arborescence de la conception Tracker Pro (references/) — liens cassés, fichiers orphelins, écart avec Architecture.md. Produit un rapport structuré des points à corriger, sans modifier les fichiers. À utiliser après tout ajout/suppression de fichier dans references/, ou dans le cadre de /verify-conception.
---

# Vérification des liens et de l'arborescence (Tracker Pro)

Ce skill inspecte en lecture seule les liens Markdown et l'arborescence documentée dans `references/` et restitue un rapport structuré. Il ne modifie jamais de fichier.

## Étapes

1. **Lister l'état actuel** de `references/` (`ls references/` ou équivalent) pour travailler sur la liste réelle de fichiers, pas sur une liste figée.

2. **Lire en entier** (pas des extraits) tous les fichiers de `references/`, en particulier `Architecture.md`, et vérifier :
   - Les liens Markdown vers des fichiers `references/*.md` inexistants.
   - Les fichiers présents dans `references/` mais jamais référencés depuis aucun autre fichier.
   - L'écart entre l'arborescence documentée dans `Architecture.md` et les fichiers réellement présents.

3. **Pour chaque point relevé**, citer le texte exact du problème avec son fichier, et le classifier :
   - **Incohérence avérée** : deux fichiers se contredisent, ou un renvoi pointe vers du contenu inexistant.
   - **Ambiguïté à trancher** : le texte est cohérent mais laisse une question ouverte non documentée dans `questions_a_approfondir.md`.
   - **Suggestion** : amélioration de clarté, non bloquante.

4. **Présenter le rapport** à l'utilisateur (texte direct dans la réponse, pas de fichier créé sauf demande explicite). Si rien n'est trouvé, le dire explicitement plutôt que de forcer un résultat.

## Garde-fous

- Ce skill est en **lecture seule** : ne jamais éditer de fichier de `references/` (ni ailleurs) dans le cadre de ce skill.
- Ne pas re-signaler les points déjà explicitement traités comme « à approfondir plus tard » dans `questions_a_approfondir.md` — ce ne sont pas des oublis, sauf si une formulation incohérente sur *comment* ce report est exprimé est détectée.
