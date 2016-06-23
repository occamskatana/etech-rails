# == Schema Information
#
# Table name: residents
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#  first_name             :string
#  last_name              :string
#  phone_number           :string
#  calendar               :url
#  sober_date             :string
#  phase                  :string
#

class ResidentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number, :phase, :sober_date, :location, :calendar_url

  def firebase_shit
  		firebase = Firebase::Client.new("https://evolutiontech.firebaseio.com/residents/#{object.id}/locations")
  	response = firebase.get('')
  	return response.body.to_a
  end



  def location
  	return firebase_shit.last.last
  end

  def calendar_url
  	"https://evolutiontech.firebaseio.com/residents/#{object.id}/calendar"
  end

  def chat_url
  	"https://evolutiontech.firebaseio.com/residents/#{object.id}/chat"
  end
  
end
