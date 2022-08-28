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
	date := r.PostFormValue("date")
	isOK,output := data.GetUserInfoByUserId(userId,date)
	if isOK{
		w.Header().Set("Content-Type", "application/json")
		w.Write(output)
		w.WriteHeader(http.StatusOK)
	}else{
		w.WriteHeader(http.StatusNotFound)
	}
}