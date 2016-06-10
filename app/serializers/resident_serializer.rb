class ResidentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number, :calendar, :phase, :sober_date, :locations

  def locations
  	return "https://evolutiontech.firebaseio.com/residents/#{object.id}/locations"
  end
end
