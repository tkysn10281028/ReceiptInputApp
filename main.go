package main

import (
	"fmt"
	"net/http"
	"time"
)

func main(){
	server := http.Server{
		Addr: ":8082",
	}
	http.Handle("/", http.FileServer(http.Dir("./test")))
	fmt.Println(time.Now().String() + "server listening...")
	hello()
	server.ListenAndServe()
}

func hello(){
	fmt.Println("hello")
}