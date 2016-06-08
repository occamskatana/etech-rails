# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.find(1) === nil
	admin = User.create!(email: 'johngallweycarter@gmail.com', password: 'helloworld', role: 'case_manager')
end




residents = 10.times {
	Resident.create(
		email: Faker::Internet.email,
		password: 'helloworld',
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name, 
		phone_number: Faker::PhoneNumber.cell_phone,
		calendar: 'https://e-tech.firebaseio.com/users/bdsimmons/events',
		user_id: User.first.id,
		phase: ["1", "2", "3"].sample,
		sober_date: Faker::Date.backward(500)
	)
}

residents = Resident.all


cases = residents.each {|resident| 
	Case.create(
		user_id: 1,
		resident_id: resident.id
		)
}


def js_convert(time)
	time.to_f * 1000
end

locations = residents.each do |resident|
	rawr = Location.create!(
		latitude: 41.365505,
		longitude: -72.91418,
		resident_id: resident.id
		)
	firebase = Firebase::Client.new('https://evolutiontech.firebaseio.com/residents')
	response = firebase.push("#{resident.id}/locations", {location: "[#{rawr.latitude}, #{rawr.longitude}]"})
	puts "#{resident.first_name} #{resident.last_name} Firebase Upload successful? #{response.success?}"
end

calendars = residents.each do |resident|
	10.times do 
		firebase = Firebase::Client.new('https://evolutiontech.firebaseio.com/residents')
		start_time = Faker::Time.between(DateTime.now, DateTime.now + 1)
		end_time = start_time + 1.hour
		firebase.push("#{resident.id}/calendar", {start: js_convert(start_time), end: js_convert(end_time), title: Faker::Hipster.word})
		puts "Pushed calendar event for #{resident.first_name} to firebase"
	end
end

puts "Admin Created"

