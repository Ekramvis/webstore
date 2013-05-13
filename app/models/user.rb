class User < ActiveRecord::Base
	attr_accessible :email, :password_confirmation, :password

	validates :email, presence: true
	validates :email, uniqueness: true

	has_secure_password

	validates_presence_of :password, :on => :create
end