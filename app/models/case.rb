class Case < ActiveRecord::Base
  belongs_to :user
  belongs_to :resident
end