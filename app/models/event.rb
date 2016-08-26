class Event < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { minimum: 5}
  validates :description, presence: true, length: {minimum: 10}
  has_many :joins, dependent: :destroy
  has_many :users_joined, through: :joins, source: :user
end