package data

import "encoding/json"

func GetUserInfoByUserId(userId string) (bool,[]byte) {
	statement := getUserInfoByUserIdSQL()
	userInfoModels := []UserInfoModel{}
	rows, err := Db.Query(statement,userId)
	if err != nil {
		panic(err)
	}
	defer rows.Close()
	for rows.Next(){
		infoModel := UserInfoModel{}
		err = rows.Scan(
			&infoModel.UserId,
			&infoModel.UserName,
			&infoModel.PostedDate,
			&infoModel.PostedTime,
			&infoModel.MajorItemName,
			&infoModel.MajorItemPrice,
			&infoModel.MajorItemId,
			&infoModel.MiddleItemName,
			&infoModel.MiddleItemPrice,
			&infoModel.MiddleItemId,
			&infoModel.MajorItemIdInMiddle,
			&infoModel.MinorItemName,
			&infoModel.MinorItemPrice,
			&infoModel.MinorItemId,
			&infoModel.MiddleItemIdInMinor,
		)
		if err !=nil{
			panic(err)
		}
		userInfoModels = append(userInfoModels, infoModel)
	}
	rows.Close()
	output , err := json.MarshalIndent(&userInfoModels,"","\t\t")
	if err !=nil{
		panic(err)
	}
	return true ,output
}