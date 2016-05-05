# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if User.where(email: 'johngallweycarter@gmail.com') != nil
	admin = User.create!(email: 'johngallweycarter@gmail.com', password: 'helloworld')
end


puts "#{admin} created"