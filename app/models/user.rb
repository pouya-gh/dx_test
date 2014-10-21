class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /.+\@.+\..+/
  validates :password, length: { minimum: 4, maximum: 30 }
  validates :email, format: { with: EMAIL_REGEX }
end
