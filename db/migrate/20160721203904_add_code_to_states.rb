class AddCodeToStates < ActiveRecord::Migration
  def change
    add_column :states, :code, :string, limit: 2 
  end
end
