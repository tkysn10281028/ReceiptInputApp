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
	_,output := data.GetUserInfoByUserId("001","2022/8/12")
	json.Unmarshal(output,&userInfoModels)
	json.Unmarshal(utils.OpenAndUnmarshalJsonFile("./jsonFileForTest/TestGetUserInfoByUserId1.json"),
	&userInfoModelsExpected)
	assert.Equal(t, userInfoModelsExpected, userInfoModels)
}
func TestGetUserInfoByUserId2(t *testing.T) {
	var userInfoModels []data.UserInfoModel
	var userInfoModelsExpected []data.UserInfoModel
	_,output := data.GetUserInfoByUserId("002","2022/8/13")
	json.Unmarshal(output,&userInfoModels)
	json.Unmarshal(utils.OpenAndUnmarshalJsonFile("./jsonFileForTest/TestGetUserInfoByUserId2.json"),
	&userInfoModelsExpected)
	assert.Equal(t, userInfoModelsExpected, userInfoModels)
}