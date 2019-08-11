package main

import (
	"fmt"
)

func getAllCoaches(year int) []coach {
	db := initDb()
	var coaches []coach
	query := fmt.Sprintf("SELECT * FROM coach WHERE c_year=%d;", year)
	db.Select(&coaches, query)
	defer db.Db.Close()
	return coaches
}

func getOpponents(target string, year int) []coach {
	db := initDb()
	var coaches []coach
	// TODO: find if can do the below without the format string
	query := fmt.Sprintf("SELECT * FROM coach WHERE c_coach_id!='%s' AND c_year=%d;", target, year)
	db.Select(&coaches, query)
	defer db.Db.Close()
	return coaches
}

func getOpponentsIDs(target string, year int) []string {
	opponentCoaches := getOpponents(target, year)
	var opponents []string
	for _, opponent := range opponentCoaches {
		opponents = append(opponents, opponent.ID)
	}
	return opponents
}

func getRoundOpponentID(target string, round int, year int) string {
	db := initDb()
	var roundMatchupRow roundMatchup
	// TODO: find if can do the below without the format string

	query := fmt.Sprintf("SELECT * FROM round_matchup WHERE rm_round=%d AND rm_year=%d AND (rm_c_coach_id_1='%s' OR rm_c_coach_id_2='%s');", round, year, target, target)
	db.SelectOne(&roundMatchupRow, query)
	defer db.Db.Close()

	if roundMatchupRow.Coach1 == target {
		return roundMatchupRow.Coach2
	}
	return roundMatchupRow.Coach1
}
