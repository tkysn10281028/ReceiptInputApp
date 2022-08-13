package main

import (
	"fmt"
	"net/http"
	"time"
)

func main(){
	server := http.Server{
		Addr: ":8080",
	}
	http.Handle("/receipt", http.FileServer(http.Dir("./test")))
	fmt.Println(time.Now().String() + "server listening...")
	server.ListenAndServe()
}