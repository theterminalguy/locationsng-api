class CreateRuralPostCodes < ActiveRecord::Migration
  def change
    create_table :rural_post_codes do |t|
      t.integer :rural_district_id
      t.integer :code
      t.string :towns
    end

    add_index :rural_post_codes, :rural_district_id
  end
end
