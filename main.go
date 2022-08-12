package main

import "net/http"

func main(){
	server := http.Server{
		Addr: ":8082",
	}
	http.Handle("/", http.FileServer(http.Dir("./test")))
	server.ListenAndServe()
}