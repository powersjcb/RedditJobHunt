class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :listing_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :votes, :user_id
    add_index :votes, :listing_id
    add_index :votes, [:user_id, :listing_id], unique: true
  end
end
