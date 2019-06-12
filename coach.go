package main

import "github.com/go-gorp/gorp"
import "fmt"

func getAllCoaches(db *gorp.DbMap) []coach {
	var coaches []coach
	db.Select(&coaches, "SELECT * FROM coach;")
	return coaches
}

func getOpponents(db *gorp.DbMap, target string) []coach {
	var coaches []coach
	// TODO: find if can do the below without the format string
	query := fmt.Sprintf("SELECT * FROM coach WHERE c_coach_id!='%s';", target)
	db.Select(&coaches, query)
	return coaches
}
