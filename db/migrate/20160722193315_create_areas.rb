class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :town_id
      t.string :name
    end

    add_index :areas, :town_id
  end
end
