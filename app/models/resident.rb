# == Schema Information
#
# Table name: residents
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string
#  nickname               :string
#  image                  :string
#  email                  :string
#  tokens                 :text
#  created_at             :datetime
#  updated_at             :datetime
#  user_id                :integer
#  first_name             :string
#  last_name              :string
#  phone_number           :string
#  calendar               :string
#  sober_date             :string
#  phase                  :string
#  house_address          :string
#

class Resident < ActiveRecord::Base
  # Include default devise modules.

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable

  include DeviseTokenAuth::Concerns::User

  belongs_to :user
  has_many :locations

   private

   def callback
    puts "Sex"
   end
end
