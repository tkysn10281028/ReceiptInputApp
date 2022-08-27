package main

import (
	"io/ioutil"
	"net/http"
	"os"
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
func openAndUnmarshalJsonFile(path string)([]byte){
	jsonFile,err := os.Open(path)
    if err != nil{
		panic(err)
	}
	jsonData ,err := ioutil.ReadAll(jsonFile)
	if err != nil{
		panic(err)
	}
	return jsonData
}

func test(){
	
}