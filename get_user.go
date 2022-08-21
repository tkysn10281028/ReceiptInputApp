package main

import (
	"net/http"
	"out/data"
	"out/utils"
)

func getUserInfoByUserId(w http.ResponseWriter, r *http.Request){
	r.ParseForm()
	utils.LogPostForm(r)
	userId := r.PostFormValue("userId")
	isOK,output := data.GetUserInfoByUserId(userId)
	if isOK{
		w.Header().Set("Content-Type", "application/json")
		w.Write(output)
		w.WriteHeader(http.StatusOK)
	}else{
		w.WriteHeader(http.StatusNotFound)
	}
}