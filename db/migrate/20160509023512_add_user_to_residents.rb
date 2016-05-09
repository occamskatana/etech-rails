class AddUserToResidents < ActiveRecord::Migration
  def change
    add_reference :residents, :user, index: true, foreign_key: true
  end
end
