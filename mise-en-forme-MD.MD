# Mise en forme en MarkDown

| Élément | Exemple rendu | Code Markdown |
|--------|---------------|---------------|
| **Titre** | # Titre | ```# Titre``` |
| **Sous‑titre** | ## Sous‑titre | ```## Sous‑titre``` |
| **Sous‑section** | ### Sous‑section | ```### Sous‑section``` |
| **Détail** | #### Détail | ```#### Détail``` |
| **Lien interne vers un titre** | [Titre](#titre) | ```[Nom du titre](#titre)``` |
| **Liste à puces** | - Liste| ```- Liste``` |
| **Liste numérotée** | 1. Étape 1 <br> 2. Étape 2 <br> 3. Étape 3 | ```1. Étape 1 2. Étape 2 3. Étape 3``` |
| **Mettre une image depuis le dépôt Git** | ![Nom_pour_désigner_l'image](/Fichier_où_se_trouve_l'image/Nom_de_l'image.son_format) | ```![Nom_pour_désigner_l'image](/Fichier_où_se_trouve_l'image/Nom_de_l'image.son_format)``` |
| **Lien vers un fichier du dépôt** | [Mot ou phrase](chemin-du_fichier)| ```[Mot ou phrase](Fichier_où_se_trouve_le_fichier/Nom_du_fichier.son_format)``` |
| **Lien vers un site internet** | [Mot ou phrase](https://site.site/) | ```[Mot ou phrase](https://site.site/)``` |
| **Badges** | *(badges)* | ```![Build Status](https://img.shields.io/badge/build-passing-brightgreen)![Licence](https://img.shields.io/badge/licence-MIT-blue)``` |
| **Code (JS, etc.)** | Voir en dessous | \`\`\`js function hello() {  console.log("Hello world")}\`\`\` |

```js 
function hello() { console.log("Hello world") }
```