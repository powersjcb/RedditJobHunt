# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  group_id    :integer          not null
#  user_id     :integer          not null
#  name        :string           not null
#  description :text             default(""), not null
#  url         :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Organization < ActiveRecord::Base
  validates(
    :user_id, :group_id,
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

  validate :user_belongs_to_group



  belongs_to :creator, class_name: "User"
  belongs_to :group
  has_many :listings
  has_many :votes, through: :listings, source: :votes




  private

  def user_belongs_to_group
    unless creator.groups.pluck(:id).include?(group_id)
      errors.add(:group_id, "user doesn't belong to group")
    end
  end


end
