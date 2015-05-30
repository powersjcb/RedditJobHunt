# == Schema Information
#
# Table name: listings
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  user_id         :integer          not null
#  name            :string           not null
#  description     :text             default(""), not null
#  url             :text             default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Listing < ActiveRecord::Base
  validates(
    :user_id, :organization_id,
      presence: true
  )
  validates(
    :name, presence: true,
      allow_blank: false,
      length: { maximum: 140 }
  )
  validates(
    :description, :url,
      length: { maximum: 1023 }
  )

  belongs_to :organization, inverse_of: :listings
  belongs_to :creator, class_name: "User", inverse_of: :created_listings
  has_many :votes
  has_many :voting_users, through: :votes, source: :user
  has_many :opportunities
  has_many :users_following, through: :opportunities, source: :user
end
