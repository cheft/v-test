pub fn (mut app App) find_user() []User {
	users := sql app.db {
		select from User
	}
	return users
}

pub fn (mut app App) get_user(id int) User {
	user := sql app.db {
		select from User where id == id limit 1
	}
	return user
}

pub fn (mut app App) create_user(user User) {
	sql app.db {
		insert user into User
	}
}

pub fn (mut app App) delete_user(id int) {
	sql app.db {
		delete from User where id == id
	}
}
