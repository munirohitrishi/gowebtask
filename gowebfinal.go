package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hi there,  %s!", r.URL.Path[1:])
	dt := time.Now()
	//fmt.Println("Current date and time is: ", dt.String())
	fmt.Fprintf(w, "curent date and time %s", dt.String())
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))

}
