class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.integer :state_id
      t.string :name
    end

    add_index :towns, :state_id
  end
end
