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

require 'rails_helper'

RSpec.describe Opportunity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
