import os
import vweb

['/users/photo'; post]
fn (mut app App) users_1() vweb.Result {
	files := app.files['photo']
	os.write_file('./src/asset/upload.png', files[0].data) or {
		panic('file not save')
	}
	return app.json({
		'ok': true,
	})
}

['/users/photo']
fn (mut app App) users_2() vweb.Result {
	app.set_content_type('image/png')
	// app.add_header('content-disposition','attachment;filename=中文名.png')
	return app.file('./src/asset/v-logo.png')
}

['/users']
fn (mut app App) users_3() vweb.Result {
	return app.json(app.find_user())
}

['/users/:id']
fn (mut app App) users_4(id int) vweb.Result {
	return app.json(app.get_user(id))
}

['/users'; post]
fn (mut app App) users_5() vweb.Result {
	app.create_user(&User{
		name: app.form['name'],
		age: app.form['age'].int(),
		country: app.form['country'],
	})
	return app.json({
		'ok': true,
	})
}

['/users/:id'; put]
fn (mut app App) users_6(id string) vweb.Result {
	return app.json({
		'ok': false,
	})
}

['/users/:id'; delete]
fn (mut app App) users_7(id int) vweb.Result {
	app.delete_user(id)
	return app.json({
		'ok': true,
	})
}
