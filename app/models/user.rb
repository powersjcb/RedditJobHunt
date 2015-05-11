class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_groups, class_name: "Group"
  has_many :created_organizations, class_name: "Organization"
  has_many :created_listings, class_name: "Listing"
  has_many :votes
  has_many :memberships
  has_many :groups, through: memberships: source: :group
  has_many :opportunities
  has_many :followed_listings, through: :opportunities, source: :listing

end
