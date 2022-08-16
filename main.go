package main

import (
	"net/http"
	"out/utils"
)

func main(){
	server := http.Server{
		Addr: ":8082",
	}
	http.Handle("/", http.FileServer(http.Dir("./receiptinput/dist")))
	http.HandleFunc("/api/v1/getUserInfoByUserId",getUserInfoByUserId)
	utils.LogFirstAccess()
	server.ListenAndServe()
}