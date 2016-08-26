class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, presence: true, length: { in: 2..20 }
	validates :last_name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :password, presence: true, confirmation: true, length: { minimum: 6 }, on: :update, allow_blank: true
	validates :password_confirmation, presence: true, on: :update, allow_blank: true
	has_many :events
	has_many :joins, dependent: :destroy
	has_many :events_joined, through: :joins, source: :event
end
