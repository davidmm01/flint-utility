package main

import (
	"database/sql"
	"log"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/go-gorp/gorp"
)

// changing the name of the db user to "flintuser" in the Dockerfile, will need to adjust below!
// but lets not change anything just yet ;)s
func initDb() *gorp.DbMap {
	fmt.Println("trying to open...")
	db, err := sql.Open("mysql", "root:123@tcp(db:3306)/FLINT")
	fmt.Println("next line should be error...")
	fmt.Println(err)
	// in order for the above to work, had to link my user 'devbox' to the password '123', follow instructions here:
	// https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost

	checkErr(err, "sql.Open failed")

	// construct a gorp DbMap
	dbmap := &gorp.DbMap{Db: db, Dialect: gorp.SqliteDialect{}}

	return dbmap
}

func checkErr(err error, msg string) {
	if err != nil {
		fmt.Println(err)
		log.Fatalln(msg, err)
	}
}
