# == Schema Information
#
# Table name: memberships
#
#  id       :integer          not null, primary key
#  user_id  :integer          not null
#  group_id :integer          not null
#

class Membership < ActiveRecord::Base
  validates :user_id, :group_id, presence: true

  belongs_to :user
  belongs_to :group
end
