package data

import (
	"database/sql"
	"os/user"

	_ "github.com/go-sql-driver/mysql"
)

type UserInfoModel struct{
	UserId sql.NullString
	UserName sql.NullString
	PostedDate sql.NullString
	PostedTime sql.NullString
	MajorItemName sql.NullString
	MajorItemPrice sql.NullInt64
	MajorItemId sql.NullInt64
	MiddleItemName sql.NullString
	MiddleItemPrice sql.NullInt64
	MiddleItemId sql.NullInt64
	MajorItemIdInMiddle sql.NullInt64
	MinorItemName sql.NullString
	MinorItemPrice sql.NullInt64
	MinorItemId sql.NullInt64
	MiddleItemIdInMinor sql.NullInt64
}
var Db *sql.DB
func init() {
	usr ,_ := user.Current()
	var dbConf string
	if(usr.HomeDir =="/home/ec2-user" || usr.HomeDir == "/home/jenkins"){
		dbConf = "myapp:@Pleasure1@tcp(10.0.2.10:3306)/myapp?charset=utf8mb4"
	}else{
		dbConf =  "myapp:@Pleasure1@/myapp"
	}
	var err error
	Db, err = sql.Open("mysql", dbConf)
	if err != nil {
		panic(err)
	}
}