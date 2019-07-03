package main

import (
	"fmt"

	"github.com/go-gorp/gorp"
)

func getScoreSettings(db *gorp.DbMap, year int) scoreSettings {
	var settings scoreSettings
	query := fmt.Sprintf("SELECT * FROM score_settings WHERE ss_year=%d;", year)
	db.SelectOne(&settings, query)
	return settings
}
