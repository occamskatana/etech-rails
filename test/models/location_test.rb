# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  resident_id :integer
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address     :string
#

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
