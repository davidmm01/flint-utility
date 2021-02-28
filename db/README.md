# flint-utility Database

`flint-utility` uses [MySQL](https://www.mysql.com) v8

## Run through docker

### With docker

To soley run the DB container, simply run (from this directory):

`docker build . -t <YOUR TAG>`

`docker run --rm -p 3306:3306 <YOUR TAG>`

Then connect to container:

`mysql -h 127.0.0.1 -P 3306 -u root -p FLINT`

### With docker-compose

To run the whole stack of containers via docker-compose, see the parent directories `README.md`

## Install and run locally

TODO: test and confirm this section, only docker instructions are confirmed to work

To install:

`sudo apt install -y mysql-server`

To start the mysql server:

`sudo /etc/init.d/mysql start` TODO verify this

To push the schema into it:

TODO

To connect:

TODO

## To dump the schema

While the database is up, run:

`mysqldump -h 127.0.0.1 -P 3306 -u root -p --all-databases > schema.sql`
