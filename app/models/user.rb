class User < ApplicationRecord
  extend Devise::Models
  validates_uniqueness_of :email
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
