package data

func getUserInfoByUserIdSQL() (string) {
	return `
	SELECT
		A.USER_ID AS USER_ID,
		A.USER_NAME AS USER_NAME,
		B.POSTED_DATE AS POSTED_DATE,
		B.POSTED_TIME AS POSTED_TIME,
		B.MAJOR_ITEM_NAME AS MAJOR_ITEM_NAME,
		B.MAJOR_ITEM_PRICE AS MAJOR_ITEM_PRICE,
   		B.MAJOR_ITEM_INCREMENT_ID AS MAJOR_ITEM_ID,
		C.MIDDLE_ITEM_NAME AS MIDDLE_ITEM_NAME,
		C.MIDDLE_ITEM_PRICE AS MIDDLE_ITEM_PRICE,
		C.MIDDLE_ITEM_INCREMENT_ID AS MIDDLE_ITEM_ID,
		C.MAJOR_ITEM_INCREMENT_ID AS MAJOR_ITEM_ID_IN_MIDDLE,
		D.MINOR_ITEM_NAME AS MINOR_ITEM_NAME,
		D.MINOR_ITEM_PRICE AS MINOR_ITEM_PRICE,
		D.MINOR_ITEM_INCREMENT_ID,
		D.MIDDLE_ITEM_INCREMENT_ID AS MIDDLE_ITEM_ID_IN_MINOR
	FROM
    	USER_INFO A
	LEFT JOIN MAJOR_ITEM B ON
    	A.USER_ID = B.USER_ID
	LEFT JOIN MIDDLE_ITEM C ON
    	B.MAJOR_ITEM_INCREMENT_ID = C.MAJOR_ITEM_INCREMENT_ID
	LEFT JOIN MINOR_ITEM D ON
    	C.MIDDLE_ITEM_INCREMENT_ID = D.MIDDLE_ITEM_INCREMENT_ID
	WHERE
		A.USER_ID = ? 
		AND
		B.POSTED_DATE = ?
		AND(
        (
            C.DELETE_FLG = 0 OR D.DELETE_FLG = 0
        ) OR(
            C.DELETE_FLG IS NULL OR D.DELETE_FLG IS NULL
        )
    )
	`
}