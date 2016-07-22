class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
    end
  end
end
