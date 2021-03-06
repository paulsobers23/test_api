class User < ApplicationRecord
  extend Devise::Models
  validates :email, presence: true
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
