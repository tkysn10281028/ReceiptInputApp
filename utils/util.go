package utils

import (
	"log"
	"net/http"
	"net/url"
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