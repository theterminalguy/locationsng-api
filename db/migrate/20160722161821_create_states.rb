class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :code
      t.string :name
      t.string :capital
      t.float :lat
      t.float :lng
      t.integer :zone_id
    end
  end
end
