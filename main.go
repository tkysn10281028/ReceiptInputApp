package main

import (
	"fmt"
	"net/http"
)

func main(){
	server := http.Server{
		Addr: ":8080",
	}
	http.Handle("/receipt", http.FileServer(http.Dir("./test")))
	fmt.Println("server listening...")
	server.ListenAndServe()
}