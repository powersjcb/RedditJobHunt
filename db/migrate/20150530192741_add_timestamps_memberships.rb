class AddTimestampsMemberships < ActiveRecord::Migration
  def change
    add_timestamps :memberships, null: false
  end
end
