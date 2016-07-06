class AddHouseToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :house_address, :string
  end
end
