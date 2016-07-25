class CreatePostCodes < ActiveRecord::Migration
  def change
    create_table :post_codes do |t|
      t.integer :area_id
      t.integer :code
      t.text :streets
    end

    add_index :post_codes, :area_id
    add_index :post_codes, :code
  end
end
