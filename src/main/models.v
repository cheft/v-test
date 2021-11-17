[table: 'users']
struct User {
	id        int    [primary; sql: serial] // a field named `id` of integer type must be the first field
	name      string [nonull]
	age       int
	country   string [nonull]
}

pub fn (mut app App) migrate() {
	// sql orm.db {
	// 	drop table User
	// }
	sql app.db {
		create table User
	}
}