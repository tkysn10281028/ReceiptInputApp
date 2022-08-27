package main

import (
	"encoding/json"
	"out/data"
	"out/utils"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetUserInfoByUserId1(t *testing.T) {
	var userInfoModels []data.UserInfoModel
	var userInfoModelsExpected []data.UserInfoModel
	_,output := data.GetUserInfoByUserId("001")
	json.Unmarshal(output,&userInfoModels)
	json.Unmarshal(utils.OpenAndUnmarshalJsonFile("./jsonFileForTest/TestGetUserInfoByUserId1.json"),
	&userInfoModelsExpected)
	assert.Equal(t, userInfoModelsExpected, userInfoModels)
}
func TestGetUserInfoByUserId2(t *testing.T) {
	var userInfoModels []data.UserInfoModel
	var userInfoModelsExpected []data.UserInfoModel
	_,output := data.GetUserInfoByUserId("002")
	json.Unmarshal(output,&userInfoModels)
	json.Unmarshal(utils.OpenAndUnmarshalJsonFile("./jsonFileForTest/TestGetUserInfoByUserId2.json"),
	&userInfoModelsExpected)
	assert.Equal(t, userInfoModelsExpected, userInfoModels)
}