# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  name        :string           not null
#  description :text             default(""), not null
#  url         :text             default(""), not null
#  img_url     :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  validates(
    :user_id,
      presence: true
  )
  validates(
    :name, presence: true,
      allow_blank: false,
      length: { maximum: 140 }
  )
  validates(
    :description, :url, :img_url,
      length: { maximum: 1023 }
  )

  belongs_to :creator, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :organizations
  has_many :listings, through: :organizations, source: :listings
end
