---
name: verify-conception
description: Vérifie la cohérence des documents de conception de Tracker Pro (references/) sur 6 axes transverses (BDD, admin central, chiffrement, contrats inter-modules, liens/arborescence, terminologie/statut). Produit un rapport structuré des points à corriger, sans modifier les fichiers. À utiliser avant de commencer ou reprendre l'implémentation, ou après toute modification de references/.
---

# Vérification de cohérence de la conception (Tracker Pro)

Ce skill orchestre une inspection multi-agents en lecture seule sur `references/`, un agent par axe transverse, et restitue un rapport agrégé structuré. Il ne modifie jamais de fichier — c'est à l'utilisateur de corriger lui-même, ou d'invoquer ensuite `/resolve-conception-issues` pour une résolution guidée.

Les 6 axes sont chacun définis par leur propre skill, invocable aussi de façon isolée : `verify-bdd`, `verify-admin-central`, `verify-chiffrement`, `verify-contrats-inter-modules`, `verify-liens-arborescence`, `verify-terminologie-statut`. Ce skill ne fait que les enchaîner en parallèle et agréger leurs rapports — les instructions de chaque axe restent définies une seule fois, dans le `SKILL.md` de l'axe correspondant.

## Étapes

1. **Lister l'état actuel** de `references/` (`ls references/` ou équivalent) pour travailler sur la liste réelle de fichiers, pas sur une liste figée — de nouveaux fichiers ont pu être ajoutés depuis la dernière inspection.

2. **Lire le contenu des 6 `SKILL.md` d'axe** (`.claude/skills/verify-bdd/SKILL.md`, `.claude/skills/verify-admin-central/SKILL.md`, `.claude/skills/verify-chiffrement/SKILL.md`, `.claude/skills/verify-contrats-inter-modules/SKILL.md`, `.claude/skills/verify-liens-arborescence/SKILL.md`, `.claude/skills/verify-terminologie-statut/SKILL.md`) pour obtenir les instructions à jour de chaque axe — ne pas se fier à une version mémorisée, ces fichiers font foi.

3. **Lancer en parallèle, dans un seul message, 6 agents `Explore` en lecture seule** (aucune modification de fichier, aucun agent `general-purpose` sauf si une analyse croisée complexe le justifie explicitement), un par axe. Donner à chaque agent : la liste réelle des fichiers de `references/` obtenue à l'étape 1, et le corps du `SKILL.md` de son axe lu à l'étape 2 comme instructions à suivre (lire les fichiers concernés **en entier**, pas des extraits ; citer le texte exact de chaque point relevé avec son fichier ; dire explicitement s'il n'a rien trouvé plutôt que de forcer un résultat).

4. **Agréger** les 6 rapports reçus en un seul, groupé par axe. Pour chaque point : fichier(s) concerné(s), citation exacte, et une classification :
   - **Incohérence avérée** : deux fichiers se contredisent, ou un renvoi pointe vers du contenu inexistant.
   - **Ambiguïté à trancher** : le texte est cohérent mais laisse une question ouverte non documentée dans `questions_a_approfondir.md`.
   - **Suggestion** : amélioration de clarté, non bloquante.

   Si deux agents d'axes différents relèvent **indépendamment le même point** (même fichier(s), même problème signalé sous un angle différent), fusionner leurs constats en une seule entrée du rapport et le signaler explicitement comme confirmé par plusieurs axes — c'est un signal de robustesse du constat, pas un doublon à ignorer silencieusement ni à supprimer.

5. **Présenter le rapport** à l'utilisateur (texte direct dans la réponse, pas de fichier créé sauf demande explicite). Terminer en rappelant qu'il peut soit corriger lui-même les fichiers de `references/`, soit invoquer `/resolve-conception-issues` pour une résolution guidée point par point.

## Garde-fous

- Ce skill est en **lecture seule** : ne jamais éditer de fichier de `references/` (ni ailleurs) dans le cadre de ce skill.
- Ne pas re-signaler les points déjà explicitement traités comme « à approfondir plus tard » dans `questions_a_approfondir.md` — ce ne sont pas des oublis, sauf si le rapport détecte une formulation incohérente sur *comment* ce report est exprimé (axe Terminologie et statut).
- Si un agent ne trouve rien sur son axe, le dire clairement dans le rapport final plutôt que d'omettre l'axe.
