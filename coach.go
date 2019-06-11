package main

import "github.com/go-gorp/gorp"

func getAllCoaches(db *gorp.DbMap) []coach {
	var coaches []coach
	db.Select(&coaches, "SELECT * FROM coach;")
	return coaches
}
