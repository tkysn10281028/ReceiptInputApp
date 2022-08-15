package main

import (
	"fmt"
	"net/http"
)

func main(){
	server := http.Server{
		Addr: ":8082",
	}
	http.Handle("/", http.FileServer(http.Dir("./receiptinput/dist")))
	fmt.Println("server listening...")
	server.ListenAndServe()
}