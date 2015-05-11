# == Schema Information
#
# Table name: opportunities
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  user_id    :integer          not null
#  status     :string           default("favorited"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Opportunity < ActiveRecord::Base
  validates(
    :user_id, :organization_id,
      presence: true
  )

  validates(
    :status, inclusion:
      { in: %w(favorited, waiting, interviewing, no, yes)}
  )

  belongs_to :user
  belongs_to :listing

end
