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

FactoryGirl.define do
  factory :group do
    
  end

end
