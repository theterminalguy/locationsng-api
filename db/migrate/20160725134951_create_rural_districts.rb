class CreateRuralDistricts < ActiveRecord::Migration
  def change
    create_table :rural_districts do |t|
      t.integer :rural_lga_id
      t.string :name
    end

    add_index :rural_districts, :rural_lga_id
  end
end
