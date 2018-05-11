class User < ActiveRecord::Base
  has_secure_password
  has_many :joins, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :joined_events, through: :joins, source: :event, dependent: :destroy
  # has_many :secrets_liked, through: :likes, source: :secret
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :location, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_save :downcase_fields
  def downcase_fields
  	self.email.downcase!
  end
end
