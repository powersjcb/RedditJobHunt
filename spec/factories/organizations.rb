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

FactoryGirl.define do
  factory :organization do
    
  end

end
