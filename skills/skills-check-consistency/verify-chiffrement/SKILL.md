---
name: verify-chiffrement
description: Vérifie la cohérence du modèle de chiffrement de Tracker Pro (modèle de menace, frontière clair/chiffré, emplacement des clés, statut de la signature du manifeste) à travers chiffrement.md et vue_ensemble.md et les fichiers qui les référencent. Produit un rapport structuré des points à corriger, sans modifier les fichiers. À utiliser après toute modification touchant le chiffrement, ou dans le cadre de /verify-conception.
---

# Vérification de la cohérence chiffrement (Tracker Pro)

Ce skill inspecte en lecture seule la conception du chiffrement dans `references/` et restitue un rapport structuré. Il ne modifie jamais de fichier.

## Étapes

1. **Lister l'état actuel** de `references/` (`ls references/` ou équivalent) pour travailler sur la liste réelle de fichiers, pas sur une liste figée.

2. **Lire en entier** (pas des extraits) `chiffrement.md`, `vue_ensemble.md` et tout autre fichier qui mentionne le chiffrement, et vérifier :
   - La cohérence du modèle de menace.
   - La frontière clair/chiffré — à partir de quel module les données sont chiffrées, de façon cohérente partout où c'est mentionné.
   - L'emplacement des clés — clé publique locale, clé privée jamais locale — de façon cohérente.
   - Le statut de la signature du manifeste — doit être marqué bloqué/reporté partout où il apparaît, sans contradiction.
   - La cohérence globale avec `chiffrement.md` et `vue_ensemble.md`.
   - Pour chaque diagramme mermaid rencontré dans ces fichiers : que le **style de trait** (plein = flux systématique/inconditionnel, pointillé = flux conditionnel/décisionnel) reflète bien la même conditionnalité que le texte qui l'entoure, pas seulement le contenu textuel des nœuds.

3. **Pour chaque point relevé**, citer le texte exact du problème avec son fichier, et le classifier :
   - **Incohérence avérée** : deux fichiers se contredisent, ou un renvoi pointe vers du contenu inexistant.
   - **Ambiguïté à trancher** : le texte est cohérent mais laisse une question ouverte non documentée dans `questions_a_approfondir.md`.
   - **Suggestion** : amélioration de clarté, non bloquante.

4. **Présenter le rapport** à l'utilisateur (texte direct dans la réponse, pas de fichier créé sauf demande explicite). Si rien n'est trouvé, le dire explicitement plutôt que de forcer un résultat.

## Garde-fous

- Ce skill est en **lecture seule** : ne jamais éditer de fichier de `references/` (ni ailleurs) dans le cadre de ce skill.
- Ne pas re-signaler les points déjà explicitement traités comme « à approfondir plus tard » dans `questions_a_approfondir.md` — ce ne sont pas des oublis, sauf si une formulation incohérente sur *comment* ce report est exprimé est détectée.
