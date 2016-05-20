class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.references :user, index: true, foreign_key: true
      t.references :resident, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
