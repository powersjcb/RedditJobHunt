class Organization < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :group
  has_many :listings
  has_many :votes, through: :listings, source: :votes

end
