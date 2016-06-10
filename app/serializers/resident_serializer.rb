class ResidentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number, :calendar, :phase, :sober_date, :locations

  def locations
  	firebase = Firebase::Client.new("https://evolutiontech.firebaseio.com/residents/#{object.id}/locations")
  	response = firebase.get('')
  	return [response.body]
  end
end
