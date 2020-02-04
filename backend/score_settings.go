package main

import (
	"fmt"
)

func getScoreSettings(year int) scoreSettings {
	var settings scoreSettings

	db := initDb()
	query := fmt.Sprintf("SELECT * FROM score_settings WHERE ss_year=%d;", year)
	db.SelectOne(&settings, query)
	defer db.Db.Close()

	return settings
}
