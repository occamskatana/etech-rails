class AddSoberdateToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :sober_date, :date
  end
end
