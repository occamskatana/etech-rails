# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create!(email: 'johngallweycarter@gmail.com', password: 'helloworld', role: 'case_manager')


Resident.create(
	email: 'jgfc35@aol.com', 
	password: 'helloworld', 
	first_name: 'Ben', 
	last_name: 'Simmons', 
	phone_number: Faker::PhoneNumber.cell_phone, 
	calendar: 'https://e-tech.firebaseio.com/users/bdsimmons/events', 
	user: User.first
	)



