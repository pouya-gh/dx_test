class User < ActiveRecord::Base
  after_save :regenerate_auth_token
  has_secure_password
  EMAIL_REGEX = /.+\@.+\..+/
  validates :password, length: { minimum: 4, maximum: 30 }
  validates :email, format: { with: EMAIL_REGEX }, presence: true, uniqueness: true

  def regenerate_auth_token
    salt = "sad <dsadj9p8j>ene*(<Udh>08b4ejbd lkjnLN@@as~~2e3$%{08}</Udh></dsadj9p8j>"
    text = Digest::MD5.hexdigest(salt + email.to_s + Time.now.to_s)
    update_column(:auth_token, text)
  end
end
