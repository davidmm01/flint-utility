package main

import (
	"fmt"
)

// TODO: unit tests for these files

// Record is used as an entry in Records
type Record struct {
	// TODO: CategoryUsed bool?
	Coach string
	Round int
	Value int
}

// RecordFloat is used as an entry in Records, specifically for disposal efficieny since its a float
type RecordFloat struct {
	// TODO: CategoryUsed bool?
	Coach string
	Round int
	Value float32
}

// Records holds the records for a year, where each Record is an array to account for ties
type Records struct {
	Score               []Record
	Kicks               []Record
	Handballs           []Record
	Marks               []Record
	Hitouts             []Record
	Tackles             []Record
	DisposalEfficiency  []RecordFloat
	ContestedPosessions []Record
	Rebounds            []Record
	Clearances          []Record
	Spoils              []Record
}

func getRecords(round int, year int, kind string) Records {
	var records Records

	records.Score = determineRecord(round, year, kind, "rs_score")
	records.Kicks = determineRecord(round, year, kind, "rs_kicks")
	records.Handballs = determineRecord(round, year, kind, "rs_handballs")
	records.Marks = determineRecord(round, year, kind, "rs_marks")
	records.Hitouts = determineRecord(round, year, kind, "rs_hitouts")
	records.Tackles = determineRecord(round, year, kind, "rs_tackles")
	records.DisposalEfficiency = determineRecordFloat(round, year, kind, "rs_disposal_efficiency")
	records.ContestedPosessions = determineRecord(round, year, kind, "rs_contested_posessions")
	records.Rebounds = determineRecord(round, year, kind, "rs_rebound_50s")
	records.Clearances = determineRecord(round, year, kind, "rs_clearances")
	records.Spoils = determineRecord(round, year, kind, "rs_spoils")

	return records
}

func determineRecord(round int, year int, kind string, category string) []Record {

	var rowsOfRoundScoreTable []roundScore

	query := fmt.Sprintf("SELECT rs_c_coach_id, rs_round, %s FROM round_score WHERE rs_year=%d AND %s=(SELECT %s(%s) FROM round_score",
		category, year, category, kind, category)
	if round != 0 {
		query += fmt.Sprintf(" WHERE rs_round=%d) AND rs_round=%d;", round, round)
	} else {
		query += ");"
	}

	db := initDb()
	db.Select(&rowsOfRoundScoreTable, query)

	// do the query again but this time only return the category so we can grab it out
	// surely there's a better way to do this... but I can't see how we can just grab the
	// key we need from rowsOfRoundScoreTable
	query = fmt.Sprintf("SELECT %s FROM round_score WHERE rs_year=%d AND %s=(SELECT %s(%s) FROM round_score",
		category, year, category, kind, category)
	if round != 0 {
		query += fmt.Sprintf(" WHERE rs_round=%d) AND rs_round=%d LIMIT 1;", round, round)
	} else {
		query += ") LIMIT 1;"
	}

	value64, _ := db.SelectInt(query)
	value := int(value64)

	defer db.Db.Close()

	var records []Record

	for _, row := range rowsOfRoundScoreTable {
		var record Record
		record.Coach = row.Coach
		record.Round = row.Round
		record.Value = value
		records = append(records, record)
	}

	return records
}

// TODO: investigate if there is a better way to do this... sucks to replicate this whole function just because it has a float32 instead of int for value...
func determineRecordFloat(round int, year int, kind string, category string) []RecordFloat {

	var rowsOfRoundScoreTable []roundScore

	query := fmt.Sprintf("SELECT rs_c_coach_id, rs_round, %s FROM round_score WHERE rs_year=%d AND %s=(SELECT %s(%s) FROM round_score",
		category, year, category, kind, category)
	if round != 0 {
		query += fmt.Sprintf(" WHERE rs_round=%d) AND rs_round=%d;", round, round)
	} else {
		query += ");"
	}

	db := initDb()
	db.Select(&rowsOfRoundScoreTable, query)

	// do the query again but this time only return the category so we can grab it out
	// surely there's a better way to do this... but I can't see how we can just grab the
	// key we need from rowsOfRoundScoreTable
	query = fmt.Sprintf("SELECT %s FROM round_score WHERE rs_year=%d AND %s=(SELECT %s(%s) FROM round_score",
		category, year, category, kind, category)
	if round != 0 {
		query += fmt.Sprintf(" WHERE rs_round=%d) AND rs_round=%d LIMIT 1;", round, round)
	} else {
		query += ") LIMIT 1;"
	}

	float64, _ := db.SelectFloat(query)
	value := float32(float64)

	defer db.Db.Close()

	var records []RecordFloat

	for _, row := range rowsOfRoundScoreTable {
		var record RecordFloat
		record.Coach = row.Coach
		record.Round = row.Round
		record.Value = value
		records = append(records, record)
	}

	return records
}
