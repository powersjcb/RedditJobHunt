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

require 'rails_helper'

RSpec.describe Vote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
