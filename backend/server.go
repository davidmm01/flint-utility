package main

import (
	"net/http"
	"strconv"

	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {
	e := echo.New()

	// CORS Middleware
	// TODO: Can probably introduce some security here, only allow the frontend to hit it
	e.Use(middleware.CORS())

	// health check
	e.GET("/", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		return c.String(http.StatusOK, "Backend is alive")
	})

	// season endpoints
	e.GET("/seasons/current", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		return c.JSON(http.StatusOK, getCurrentSeason())
	})

	// coach endpoints
	e.GET("/coaches", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		year, _ := strconv.Atoi(c.QueryParam("year"))
		coaches := getAllCoaches(year)
		return c.JSON(http.StatusOK, coaches)
	})

	// saltyboy endpoint
	e.GET("/saltyboy/round", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		coach := c.QueryParam("coach")
		round, _ := strconv.Atoi(c.QueryParam("round"))
		year, _ := strconv.Atoi(c.QueryParam("year"))
		payload := getSaltyboyRound(coach, round, year)
		// spew.Dump(payload)
		return c.JSON(http.StatusOK, payload)
	})

	// ladder endpoint
	e.GET("/ladder", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		round, _ := strconv.Atoi(c.QueryParam("round"))
		year, _ := strconv.Atoi(c.QueryParam("year"))
		payload := getLadder(round, year)
		return c.JSON(http.StatusOK, payload)
	})

	// records endpoint
	e.GET("/records", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		year, _ := strconv.Atoi(c.QueryParam("year"))
		round, _ := strconv.Atoi(c.QueryParam("round")) // optional param
		kind := c.QueryParam("kind")

		if year == 0 {
			return c.JSON(http.StatusBadRequest, "numerical 'year' query paramater required")
		}
		if kind != "min" && kind != "max" {
			return c.JSON(http.StatusBadRequest, "kind must be 'min' or 'max'")
		}

		payload := getRecords(round, year, kind)
		return c.JSON(http.StatusOK, payload)
	})

	e.GET("/averages", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		// TODO: consider removing finals from this metric
		year, _ := strconv.Atoi(c.QueryParam("year"))
		payload := getAverages(year)
		return c.JSON(http.StatusOK, payload)
	})

	e.Logger.Fatal(e.Start(":1323"))

	// TODO: need to learn about packages and break main up a bit, a lot of files already
	// TODO: query params that are not optional should return helpful errors when not provided
	//       come up with a consistent and pretty way of doing it, i don't think we should replicate
	//       the way its been done for the 'records' endpoint for each other endpoint

	// TODO: LUCKY BOY! endpoint
	// 		when u have a saltyboy that could only beat 1 opponent that round, and that happened to be their opponent!
	// 		milby actually got a luckyboy in round 2!

	// TODO: decide how the system will handle finals and tracking of this
	//		-new table?  similar to bye round table?
	//		-new column on round_matchup to indicate round type?  would be easy enough to add an extra line into format feeder for normal rounds
	//       and null the others and manually update them for the few exceptions.  This could then also replace the bye_round table

	// TODO: decide which endpoints need to have their functionality limited to only in season rounds (ladder etc...)

	// TODO: change from using float32 to float64 everywhere.  Why did I start with float32?

	// TODO: coach table has coach_year, would be good to normalise this and have another table for coach_years or something
	//       no coach is changing this year though so I have a whole year to worry about this lol but keep it in mind

}
