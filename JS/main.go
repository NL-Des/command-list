package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func main() {
	// Sert les fichiers statiques (CSS, JS)
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))

	// Route principale
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		tmpl := template.Must(template.ParseFiles("templates/index.html"))
		tmpl.Execute(w, nil)
	})

	// Démarre le serveur
	fmt.Println("Serveur de test en javascript lancé sur localhost/:8080")
	http.ListenAndServe(":8080", nil)
}
