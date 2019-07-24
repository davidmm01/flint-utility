package main

import "github.com/go-gorp/gorp"

func getTotalRounds(db *gorp.DbMap, year int) int {
	// this function isn't being used yet...
	totalRounds, err := db.SelectInt("select max(rm_round) from round_matchup WHERE rm_year=?;", year)
	checkErr(err, "getTotalRounds failed")
	return int(totalRounds)
}
