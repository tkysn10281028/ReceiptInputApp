package main

import (
	"net/http"
	"out/utils"
)

func postMajorItem(w http.ResponseWriter, r *http.Request)  {
	r.ParseForm()
	utils.LogPostForm(r)
}