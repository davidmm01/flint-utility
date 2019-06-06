package main

import (
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
)

func main() {

	dbmap := initDb()
	e := echo.New()

	// health check
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello there mr frontend!")
	})

	// coach endpoints
	// e.GET("/coaches", func(c echo.Context) error {
	// return c.(http.StatusOK, "")
	// })

	defer dbmap.Db.Close()
	e.Logger.Fatal(e.Start(":1323"))
}
