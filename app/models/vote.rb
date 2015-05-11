
# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  validates :user_id, :listing_id, presence: true

  belongs_to :user
  belongs_to :listing
end
