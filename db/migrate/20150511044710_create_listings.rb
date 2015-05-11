class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :organization_id, null: false
      t.integer :user_id,         null: false
      t.string  :name,            null: false
      t.text    :description,     null: false, default: "", limit: 1023
      t.text    :url,             null: false, default: "", limit: 1023

      t.timestamps null: false
    end

    add_index :listings, :organization_id
    add_index :listings, :name
  end
end
