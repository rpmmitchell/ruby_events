class Event < ActiveRecord::Base
  belongs_to :user
  has_many :joins
  has_many :comments, dependent: :destroy
  has_many :users_joined, through: :joins, source: :user, dependent: :destroy
  validates :name, :location, :host, presence: true
  validates_date :date, :after => lambda { Date.current }, presence: true
end
