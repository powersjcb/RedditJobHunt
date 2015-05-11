class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id,     null: false
      t.string  :name,        null: false
      t.text    :description, null: false, limit: 1023, default: ""
      t.text    :url,         null: false, limit: 1023, default: ""
      t.text    :img_url,     null: false, limit: 1023, default: ""

      t.timestamps null: false
    end
  end
end
