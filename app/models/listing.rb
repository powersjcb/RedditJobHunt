class Listing < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :votes
  has_many :voting_users, through: :votes, source: :user
  has_many :opportunities
  has_many :users_following, through: :opportunities, source: :user
end
