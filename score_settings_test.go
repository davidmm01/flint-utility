package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetScoreSettings(t *testing.T) {
	expected := scoreSettings{
		Year:                2019,
		Score:               8,
		Kicks:               6,
		Handballs:           6,
		Marks:               4,
		Hitouts:             3,
		Tackles:             4,
		DisposalEfficiency:  3,
		ContestedPosessions: 2,
		Rebounds:            1,
		Clearances:          1,
		Spoils:              3,
	}
	dbmap := initDb()
	assert.Equal(t, getScoreSettings(dbmap, 2019), expected, "getScoreSettings failed")
}
