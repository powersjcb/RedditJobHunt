# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  admin           :boolean          default(FALSE), not null
#  profile         :text             default(""), not null
#  url             :text             default(""), not null
#  img_url         :text             default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  active_group_id :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
