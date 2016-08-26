# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.count === 0
	admin = User.create!(
		email: 'johngallweycarter@gmail.com', 
		password: 'helloworld', 
		role: 'case_manager',
		name: "John Carter"
		)
end

if User.count < 2
	admin = User.create!(
		email: 'bill@simmons.com',
		name: "Bill Simmons", 
		password: 'helloworld', 
		role: 'case_manager'
		)
end




residents = 10.times {
	houses = ["1212 Quinnipiac Ave", "22 Linden", "980 Townsend Avenue", "The Cove"]
	Resident.create(
		email: Faker::Internet.email,
		password: 'helloworld',
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name, 
		phone_number: Faker::PhoneNumber.cell_phone,
		calendar: nil,
		user_id: [1, 2].sample,
		phase: ["1", "2", "3"].sample,
		sober_date: Faker::Date.backward(500),
		house_address: houses.sample
	)
}

residents = Resident.all



	def create_jc
		houses = ["1212 Quinnipiac Ave", "22 Linden", "980 Townsend Avenue", "The Cove"]
		Resident.create(
			email: "jgfc35@aol.com",
			password: "helloworld",
			first_name: "John",
			last_name: "Carter",
			phone_number: "5618708191",
			calendar: nil,
			user_id: User.first.id,
			phase: "3",
			sober_date: Date.new(2013,3,4),
			house_address: houses.sample
			)
		puts "John Carter Account Created"
	end

	create_jc unless Resident.count % 2 != 0


cases = residents.each do |resident| 
	Case.create(
		user_id: resident.user_id,
		resident_id: resident.id
		)

	puts "case for #{resident.first_name} created"

end


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
	response = firebase.push("#{resident.id}/locations", {latitude: rawr.latitude, longitude: rawr.longitude, address: "24 Greenway St, Hamden CT, 06517", time: js_convert(Time.now)})
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

	resident.calendar = "https://evolutiontech.firebaseio.com/residents/#{resident.id}/calendar"
	resident.save!
end

tasks = residents.each do |resident|
	tasks_array = ["Urine Test", "Meet with Case Manager", "Attend a Meeting", "Therapy at 4pm"]
	firebase = Firebase::Client.new('https://evolutiontech.firebaseio.com/residents')
	tasks_array.each do |task|
		firebase.push("#{resident.id}/tasks/", {name: "#{task}", complete: false, complete_by: js_convert(Time.now + 1.day)})
	end
	puts "Firebase Task Upload for #{resident.first_name} #{resident.last_name} Complete"
end

puts "Admin Created"

