class Group < ActiveRecord::Base

  belongs_to :creator, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships source: :user
  has_many :organizations
  has_many :listings, through: :organizations, source: :listings
end
