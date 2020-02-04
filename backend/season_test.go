package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetCurrentSeason(t *testing.T) {
	// this needs work, eventually when the function is refactored to use a table,
	// this will need to learn how to deal with current year
	assert.Equal(t, getCurrentSeason(), 2019, "getCurrentSeason failed")
}
