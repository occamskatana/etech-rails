class AddFieldsToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :first_name, :string
    add_column :residents, :last_name, :string
    add_column :residents, :phone_number, :string
    add_column :residents, :calendar, :url
    add_column :residents, :sober_date, :string
  end
end
