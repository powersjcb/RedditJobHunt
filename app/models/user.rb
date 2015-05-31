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

class User < ActiveRecord::Base

  attr_reader :password, :password_confirmation

  validates(
    :username, :session_token,
    presence: true, uniqueness: true
  )
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :password, length: { minimum: 6, allow_nil: true }


  validates :password, presence: true, if: :username_changed?
  validate  :password_not_changed

  validates_presence_of :password_confirmation, if: :password_confirmation?
  validate :password_confirmation_match,        if: :password_confirmation?

  after_initialize :ensure_session_token




  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships, source: :group
  has_many :created_groups, class_name: "Group"
  has_many :created_organizations, class_name: "Organization", inverse_of: :creator
  has_many :created_listings, class_name: "Listing", inverse_of: :creator
  has_many :opportunities, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :listing_votes, through: :created_listings, source: :votes

  # move onto seperate session token model
  belongs_to(
    :active_group,
    class_name: "Group",
    foreign_key: :active_group_id
  )


  ### class methods

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
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

  def password_confirmation=(password_confirmation)
    @password_confirmation = password_confirmation
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def membership_of(group)
    self.memberships.find_by(group_id: group.id)
  end


  private

  def password_changed?
    !self.is_password?(self.password)
  end

  def username_changed?
    self.username != User.find(self.id).username
  end

  def password_not_changed
    if password_changed? && username_changed?
      errors.add(:password,
        "and username must be changed seperately")
    end
  end

  def password_confirmation?
    password_changed? || username_changed?
  end

  def password_confirmation_match
    unless password == password_confirmation
      errors.add(:password_confirmation, "doesn't match password")
    end
  end
end
