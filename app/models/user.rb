class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 4, maximum: 30 }
end
