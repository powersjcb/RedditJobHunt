class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.integer :listing_id, null: false
      t.integer :user_id,    null: false
      t.string  :status,     null: false, default: "favorited"

      t.timestamps null: false
    end

    add_index :opportunities, :listing_id
    add_index :opportunities, :user_id
    add_index :opportunities, [:user_id, :listing_id], unique: true
  end
end
