class CreateRuralTowns < ActiveRecord::Migration
  def change
    create_table :rural_towns do |t|
      t.integer :rural_district_id
      t.string :name
    end

    add_index :rural_towns, :rural_district_id
  end
end
