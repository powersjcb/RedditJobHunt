class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.integer :group_id,    null: false
      t.integer :user_id,     null: false
      t.string  :name,        null: false
      t.text    :description, null: false, default: "", limit: 1023
      t.text    :url,         null: false, default: "", limit: 1023

      t.timestamps null: false
    end

    add_index :organizations, [:group_id, :name], unique: true
  end
end
