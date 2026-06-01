package main

import (
	"html/template"
	"log"
	"net/http"
)

type PageData struct {
	Title   string
	Message string
}

var homePageData = PageData{
	Title:   "Hello World",
	Message: "Welcome to the container platform",
}

func main() {
	tmpl := template.Must(template.ParseFiles("index.html.tmpl"))
	http.HandleFunc("/", homeHandler(tmpl))
	startServer("8080")
}

func homeHandler(tmpl *template.Template) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		if err := tmpl.Execute(w, homePageData); err != nil {
			http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		}
	}
}

func startServer(port string) {
	addr := ":" + port
	log.Printf("listening on http://localhost%s", addr)
	if err := http.ListenAndServe(addr, nil); err != nil {
		log.Fatalf("server failed to start: %v", err)
	}
}
