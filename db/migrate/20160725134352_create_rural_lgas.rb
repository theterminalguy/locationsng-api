class CreateRuralLgas < ActiveRecord::Migration
  def change
    create_table :rural_lgas do |t|
      t.integer :state_id
      t.string :name
    end

    add_index :rural_lgas, :state_id
  end
end
