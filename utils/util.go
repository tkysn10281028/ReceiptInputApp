package utils

import (
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"os"
	"strings"
)

func LogFirstAccess() {
	log.Print("Server Listening...")
}
func LogPostForm(r *http.Request) {
	str, _ := url.QueryUnescape(r.PostForm.Encode())
	strReplaced := strings.Replace(str, "&","  ||  ",-1)
	log.Print(r.URL.String() + " is called.")
	log.Print("Posted Form:" + "\n"+ strReplaced)
}

func OpenAndUnmarshalJsonFile(path string)([]byte){
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