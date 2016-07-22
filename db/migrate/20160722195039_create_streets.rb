class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.integer :area_id
      t.string :name
    end

    add_index :streets, :area_id
  end
end
