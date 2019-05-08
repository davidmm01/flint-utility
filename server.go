package main

import (
	"database/sql"
	"log"
	"net/http"

	"github.com/go-gorp/gorp"
	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello there mr frontend!")
	})

	println("pre init db")
	dbmap := initDb()

	println()
	rowCount, err := dbmap.SelectInt("SELECT count(*) FROM test_table")
	checkErr(err, "sql.Select failed")
	println("number of rows in table 'test_table' in database 'FLINT': ", rowCount)
	println("next lets grab the row!")
	// var rowOfTestTable TestTable

	defer dbmap.Db.Close()

	e.Logger.Fatal(e.Start(":1323"))
}

func initDb() *gorp.DbMap {
	// connect to db using standard Go database/sql API
	// use whatever database/sql driver you wish
	// db, err := sql.Open("mysql", "/var/run/mysqld/mysqld.sock")
	db, err := sql.Open("mysql", "devbox:123@/FLINT")
	// in order for the above to work, had to link my user 'devbox' to the password '123', had to do instruction here:
	// https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost

	checkErr(err, "sql.Open failed")

	// construct a gorp DbMap
	dbmap := &gorp.DbMap{Db: db, Dialect: gorp.SqliteDialect{}}

	// // // add a table, setting the table name to 'posts' and
	// // // specifying that the Id property is an auto incrementing PK
	// dbmap.AddTableWithName(Post{}, "posts").SetKeys(true, "Id")

	// // // create the table. in a production system you'd generally
	// // // use a migration tool, or create the tables via scripts
	// err = dbmap.CreateTablesIfNotExists()
	// checkErr(err, "Create tables failed")

	return dbmap
}

func checkErr(err error, msg string) {
	if err != nil {
		log.Fatalln(msg, err)
	}
}

type TestTable struct {
	id    int
	value string
}
