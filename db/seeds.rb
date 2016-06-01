# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create!(email: 'johngallweycarter@gmail.com', password: 'helloworld', role: 'case_manager')




residents = 10.times {
	Resident.create(
		email: Faker::Internet.email,
		password: 'helloworld',
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name, 
		phone_number: Faker::PhoneNumber.cell_phone,
		calendar: 'https://e-tech.firebaseio.com/users/bdsimmons/events',
		user_id: User.first,
		phase: ["1", "2", "3"].sample
	)
}

residents = Resident.all


cases = residents.each {|resident| 
	Case.create(
		user_id: 1,
		resident_id: resident.id
		)
}

locations = residents.each do |resident|
	rawr = Location.create!(
		latitude: 41.365505,
		longitude: -72.91418,
		resident_id: resident.id
		)
	firebase = Firebase::Client.new('https://evolutiontech.firebaseio.com/residents')
	response = firebase.push("#{resident.id}", {location: "[#{rawr.latitude}, #{rawr.longitude}]"})
	puts "Firebase Upload successful? #{response.success?}"
end

puts "Admin Created"

