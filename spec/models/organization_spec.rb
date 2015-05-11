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

require 'rails_helper'

RSpec.describe Organization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
