class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username, null: false
      t.string  :password_digest, null: false
      t.string  :session_token,   null: false
      t.boolean :admin, null: false, default: false

      t.text    :profile,  null: false, limit: 1023, default: ""
      t.text    :url,      null: false, limit: 1023, default: ""
      t.text    :img_url,  null: false, limit: 1023, default: ""

      t.timestamps null: false
    end
    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true
  end
end
