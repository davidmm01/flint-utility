package main

// LadderPlace represents the position of a coach on the ladder
type LadderPlace struct {
	Coach         string
	Wins          int
	Losses        int
	Draws         int
	PointsFor     int
	PointsAgainst int
	Percentage    float32
	Points        int
	Position      int
}

func createLadderPlaceArray(year int) []LadderPlace {
	var ladder []LadderPlace
	coaches := getAllCoaches(year)

	for _, element := range coaches {
		ladder = append(ladder, LadderPlace{
			Coach:         element.ID,
			Wins:          0,
			Losses:        0,
			Draws:         0,
			PointsFor:     0,
			PointsAgainst: 0,
			Percentage:    0,
			Points:        0,
			Position:      0,
		})
	}
	return ladder
}

func createCoachMap(ladder []LadderPlace) map[string]int {
	// Creates a mapping from coach name to the index of the coach in the ladder array.
	// This might be a hacky workaround for missing knowledge of golang, but i dont think
	// we can make a struct with dynamic key names generated on the fly...
	coachMap := make(map[string]int)
	for index, element := range ladder {
		coachMap[element.Coach] = index
	}
	return coachMap
}

func getLadder(round int, year int) []LadderPlace {

	ladder := createLadderPlaceArray(year)
	coachIndexMap := createCoachMap(ladder)

	// Determine the Wins, Losses, Draws, PointsFor, PointsAgainst and Points for each match
	matchups := getRoundMatchups(round, year)
	for _, matchup := range matchups {
		outcome, coachScore, opponentScore := getMatchOutcome(matchup.Coach1, matchup.Coach2, matchup.Round, matchup.Year)
		if outcome == WIN {
			ladder[coachIndexMap[matchup.Coach1]].Wins++
			ladder[coachIndexMap[matchup.Coach2]].Losses++
			ladder[coachIndexMap[matchup.Coach1]].Points += 4
		} else if outcome == LOSS {
			ladder[coachIndexMap[matchup.Coach1]].Losses++
			ladder[coachIndexMap[matchup.Coach2]].Wins++
			ladder[coachIndexMap[matchup.Coach2]].Points += 4
		} else if outcome == DRAW {
			ladder[coachIndexMap[matchup.Coach1]].Draws++
			ladder[coachIndexMap[matchup.Coach2]].Draws++
			ladder[coachIndexMap[matchup.Coach1]].Points += 2
			ladder[coachIndexMap[matchup.Coach2]].Points += 2
		}
		ladder[coachIndexMap[matchup.Coach1]].PointsFor += coachScore
		ladder[coachIndexMap[matchup.Coach1]].PointsAgainst += opponentScore

		ladder[coachIndexMap[matchup.Coach2]].PointsFor += opponentScore
		ladder[coachIndexMap[matchup.Coach2]].PointsAgainst += coachScore
	}

	// Determine Percentage from PointsFor and PointsAgainst
	for _, element := range ladder {
		if element.PointsAgainst != 0 { // protect from zero division
			ladder[coachIndexMap[element.Coach]].Percentage = float32(element.PointsFor) / float32(element.PointsAgainst)
		} else {
			ladder[coachIndexMap[element.Coach]].Percentage = 100
		}
	}

	// Determine Position of each coach based on points and percentage when points are tied
	// ALGORITHM:
	// 0) the positions slice will always be sorted
	// 1) iterate through the coaches in ladder
	// 2) iterate through the sorted list(highest to lowest), if we find a coach that should be ranked lower, insert before that coach
	var positions []string

	for _, element := range ladder {
		insertedAlready := false

		// if the positions array is empty, append to it and continue
		// TODO: this might not be required and might be properly handled by the final statement in the loop
		if len(positions) == 0 {
			positions = append(positions, element.Coach)
			continue
		}

		// if the coach should be ranked higher than the coach, insert into positions at the appropriate index
		for index, rankedCoaches := range positions {
			trumpPoints := ladder[coachIndexMap[element.Coach]].Points > ladder[coachIndexMap[rankedCoaches]].Points
			drawnPoints := ladder[coachIndexMap[element.Coach]].Points == ladder[coachIndexMap[rankedCoaches]].Points
			trumpPercentage := ladder[coachIndexMap[element.Coach]].Percentage > ladder[coachIndexMap[rankedCoaches]].Percentage

			if trumpPoints || (drawnPoints && trumpPercentage) {
				// https://stackoverflow.com/questions/46128016/add-single-value-at-index-in-slice
				positions = append(positions, "__tmp__")
				copy(positions[index+1:], positions[index:])
				positions[index] = element.Coach
				insertedAlready = true
				break
			}
		}

		// the coach was not ranked higher than any other coach, so append them to last
		if !insertedAlready {
			positions = append(positions, element.Coach)
		}
	}

	// set the LadderPlace.Position attribute based on index in the sorted positions slice
	for index, element := range positions {
		ladder[coachIndexMap[element]].Position = index + 1
	}

	return ladder
}
