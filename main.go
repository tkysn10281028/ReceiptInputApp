package main

import (
	"net/http"
	"out/utils"
)

func main(){
	server := http.Server{
		Addr: ":8080",
	}
	http.Handle("/", http.FileServer(http.Dir("./receiptinput/dist")))
	http.HandleFunc("/api/v1/getUserInfoByUserId",getUserInfoByUserId)
	http.HandleFunc("/api/v1/postMajorItem",postMajorItem)
	utils.LogFirstAccess()
	server.ListenAndServe()
}