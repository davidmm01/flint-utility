package main

import (
	"database/sql"
	"log"

	"github.com/go-gorp/gorp"
)

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
