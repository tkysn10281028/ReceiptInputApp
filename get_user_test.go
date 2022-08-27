package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"net/url"
	"out/data"
	"strings"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetUserInfoByUserId1(t *testing.T) {
	mux := http.NewServeMux()
    mux.HandleFunc("/api/v1/getUserInfoByUserId", getUserInfoByUserId)
    values := url.Values{}
    values.Set("userId", "001")
	req := httptest.NewRequest("POST","/api/v1/getUserInfoByUserId",strings.NewReader(values.Encode()),)
    res := httptest.NewRecorder()
    req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
    mux.ServeHTTP(res,req)
	var userInfoModels []data.UserInfoModel
	var userInfoModelsExpected []data.UserInfoModel
	json.Unmarshal(res.Body.Bytes(),&userInfoModels)
	json.Unmarshal(openAndUnmarshalJsonFile("./jsonFileForTest/TestGetUserInfoByUserId1.json"),
	&userInfoModelsExpected)
	assert.Equal(t, http.StatusOK, res.Code)
	assert.Equal(t, userInfoModelsExpected, userInfoModels)
}

func TestGetUserInfoByUserId2(t *testing.T) {
	mux := http.NewServeMux()
    mux.HandleFunc("/api/v1/getUserInfoByUserId", getUserInfoByUserId)
    values := url.Values{}
    values.Set("userId", "002")
	req := httptest.NewRequest("POST","/api/v1/getUserInfoByUserId",strings.NewReader(values.Encode()),)
    res := httptest.NewRecorder()
    req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
    mux.ServeHTTP(res,req)
	var userInfoModels []data.UserInfoModel
	var userInfoModelsExpected []data.UserInfoModel
	json.Unmarshal(res.Body.Bytes(),&userInfoModels)
	json.Unmarshal(openAndUnmarshalJsonFile("./jsonFileForTest/TestGetUserInfoByUserId2.json"),
	&userInfoModelsExpected)
	assert.Equal(t, http.StatusOK, res.Code)
	assert.Equal(t, userInfoModelsExpected, userInfoModels)
}

