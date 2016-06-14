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

require 'test_helper'

class ResidentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
