class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
