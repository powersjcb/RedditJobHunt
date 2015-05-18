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
#

class User < ActiveRecord::Base

  attr_reader :password

  validates(
    :username, :session_token,
    :admin, :profile, :url, :img_url,
    presence: true
  )
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships, source: :group
  has_many :created_groups, class_name: "Group"
  has_many :created_organizations, class_name: "Organization"
  has_many :created_listings, class_name: "Listing"
  has_many :opportunities, dependent: :destroy
  has_many :votes, dependent: :destroy


  ### class methods

  def self.find_by_credentials(username, password)
    @user = User.find_by(username)
    if @user && @user.is_password?(password)
      @user
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  # instance methods

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end



end
