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

FactoryGirl.define do
  factory :listing do
    
  end

end
