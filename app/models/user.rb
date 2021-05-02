class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :user_addresses
  has_many :orders

  validates_uniqueness_of :email
end
