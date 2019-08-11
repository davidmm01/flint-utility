package main

func getTotalRounds(year int) int {
	// this function isn't being used yet...
	db := initDb()
	totalRounds, err := db.SelectInt("select max(rm_round) from round_matchup WHERE rm_year=?;", year)
	checkErr(err, "getTotalRounds failed")
	defer db.Db.Close()
	return int(totalRounds)
}
