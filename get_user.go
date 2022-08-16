package main

import (
	"net/http"
	"out/utils"
)

func getUserInfoByUserId(w http.ResponseWriter, r *http.Request){
	r.ParseForm()
	utils.LogPostForm(r)
}