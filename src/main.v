import vweb
import mysql
import main

struct App {
	vweb.Context
mut:
	db mysql.Connection
}

fn main() {
	mut db := mysql.Connection{
		host: ''
		port: 3306
		username: ''
		password: ''
		dbname: ''
	}
	db.connect() or { panic(err) }
	println('connected mysql')
	app := &App{
		db: db
	}
	vweb.run(app, 9999)
}

// middleware
pub fn (mut app App) before_request() {
	agent := app.get_header("User-Agent")
	println('request from $agent')
}
