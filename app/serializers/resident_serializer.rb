class ResidentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number, :calendar, :phase, :sober_date, :location

  def firebase_shit
  		firebase = Firebase::Client.new("https://evolutiontech.firebaseio.com/residents/#{object.id}/locations")
  	response = firebase.get('')
  	return response.body.to_a

  end



  def location
  	return firebase_shit.last.last
  end
end
