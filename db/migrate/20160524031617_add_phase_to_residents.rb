class AddPhaseToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :phase, :string
  end
end
