"use strict"; // Face à l'âge du js, c'est une commande pour ordonner que seules les commandes modernes soient utilisées dans le code. (2009)

function saluer() {

    let message = 'Hello'; // Déclaration de la variable.
    let user = 'John';
    let age = 25;
    alert(message, user, age); // N'affiche que Hello
    alert(message + ',' + user + ',' + age); // Affiche toutes les informations

    const myConstanteTest = 'Miaou';
    alert(myConstanteTest);

    // Les types de variables.
    // Les variables peuvent changer de types.
    let essais = 'Hello';
    alert(essais);
    essais = 1234;
    alert(essais);
    essais = true;
    alert(essais);
    essais = null;
    alert(essais);
    let testUndefined;
    alert(testUndefined);
    alert(typeof essais); // Donne le type de la variable.
    alert(typeof message);
    alert(typeof myConstanteTest);

    // Les strings ont plusieurs manières de s'écrire.
    let str1 = "Hello 1";
    let str2 = 'Hello 2';
    let str3 = `Hello 3`;

    // Par contre, cest seulement avec les `` que l'on peut faire de l'encapsulation
    let  phraseEncapsulée = `Hello ${str1} ${str2} ${str3}`;
    alert(phraseEncapsulée)

}