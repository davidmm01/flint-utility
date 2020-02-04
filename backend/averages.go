package main

import (
	"fmt"
)

type Average struct {
	Name  string
	Value float32
	Rank  int
}

type Averages struct {
	Coach      string
	Categories []Average
}

func getAverages(year int) []Averages {

	var averages []Averages

	// calculate average values
	coaches := getAllCoaches(year)

	categoryMap := make(map[string]int)
	// TODO: refactor to get name and corresponding row of round_score from a table rather than hardcoded here
	//       then the categoryMap creation can also be moved to a nice for loop
	for index, element := range coaches {
		averages = append(averages, Averages{Coach: element.ID})
		averages[index].Categories = append(averages[index].Categories, Average{Name: "score", Value: getAverageValue(year, element.ID, "rs_score")})
		categoryMap["score"] = 0
		averages[index].Categories = append(averages[index].Categories, Average{Name: "kicks", Value: getAverageValue(year, element.ID, "rs_kicks")})
		categoryMap["kicks"] = 1
		averages[index].Categories = append(averages[index].Categories, Average{Name: "handballs", Value: getAverageValue(year, element.ID, "rs_handballs")})
		categoryMap["handballs"] = 2
		averages[index].Categories = append(averages[index].Categories, Average{Name: "marks", Value: getAverageValue(year, element.ID, "rs_marks")})
		categoryMap["marks"] = 3
		averages[index].Categories = append(averages[index].Categories, Average{Name: "hitouts", Value: getAverageValue(year, element.ID, "rs_hitouts")})
		categoryMap["hitouts"] = 4
		averages[index].Categories = append(averages[index].Categories, Average{Name: "tackles", Value: getAverageValue(year, element.ID, "rs_tackles")})
		categoryMap["tackles"] = 5
		averages[index].Categories = append(averages[index].Categories, Average{Name: "disposalEfficiency", Value: getAverageValue(year, element.ID, "rs_disposal_efficiency")})
		categoryMap["disposalEfficiency"] = 6
		averages[index].Categories = append(averages[index].Categories, Average{Name: "contestedPosessions", Value: getAverageValue(year, element.ID, "rs_contested_posessions")})
		categoryMap["contestedPosessions"] = 7
		averages[index].Categories = append(averages[index].Categories, Average{Name: "rebound50s", Value: getAverageValue(year, element.ID, "rs_rebound_50s")})
		categoryMap["rebound50s"] = 8
		averages[index].Categories = append(averages[index].Categories, Average{Name: "clearances", Value: getAverageValue(year, element.ID, "rs_clearances")})
		categoryMap["clearances"] = 9
		averages[index].Categories = append(averages[index].Categories, Average{Name: "spoils", Value: getAverageValue(year, element.ID, "rs_spoils")})
		categoryMap["spoils"] = 10
	}

	coachMap := createCoachMapFromAverages(averages)

	// calculate ranks
	// uses a very similar sorting sorting approach to the ladder endpoint
	for category, _ := range categoryMap {
		var rankOrder []string
		for _, element := range coaches {
			insertedAlready := false

			if len(rankOrder) == 0 {
				rankOrder = append(rankOrder, element.ID)
				continue
			}

			for rankIndex, rankElement := range rankOrder {
				if averages[coachMap[element.ID]].Categories[categoryMap[category]].Value >=
					averages[coachMap[rankElement]].Categories[categoryMap[category]].Value {
					rankOrder = append(rankOrder, "__tmp__")
					copy(rankOrder[rankIndex+1:], rankOrder[rankIndex:])
					rankOrder[rankIndex] = element.ID
					insertedAlready = true
					break
				}
			}

			if !insertedAlready {
				rankOrder = append(rankOrder, element.ID)
			}

		}

		for index, element := range rankOrder {
			averages[coachMap[element]].Categories[categoryMap[category]].Rank = index + 1
		}

	}

	// set the ranks based on calculations

	return averages
}

func getAverageValue(year int, coach string, category string) float32 {
	query := fmt.Sprintf("SELECT AVG(%s) FROM round_score WHERE rs_c_coach_id='%s' AND rs_year=%d;", category, coach, year)

	db := initDb()
	value64, _ := db.SelectFloat(query)
	defer db.Db.Close()

	return float32(value64)
}

func createCoachMapFromAverages(averages []Averages) map[string]int {
	// sort of gross since createCoachMap already exists, but there aren't generics to deal with this small difference?
	coachMap := make(map[string]int)
	for index, element := range averages {
		coachMap[element.Coach] = index
	}
	return coachMap
}
