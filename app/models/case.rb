# == Schema Information
#
# Table name: cases
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  resident_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Case < ActiveRecord::Base
  belongs_to :user
  belongs_to :resident
end
