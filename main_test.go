package main

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestIndexHandler(t *testing.T) {
    // テスト用ハンドラ作成
    mux := http.NewServeMux()
    mux.Handle("/",http.FileServer(http.Dir("./receiptinput/dist")))
    // /のリクエスト用テストコード
    req := httptest.NewRequest("GET", "/", nil)
    res := httptest.NewRecorder()
    mux.ServeHTTP(res,req)
    assert.Equal(t, http.StatusOK, res.Code)
}