class User < ApplicationRecord
  # session_key
  SessionKey = :user9999

  # validations
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, presence: true, confirmation: true
  validates :nickname, presence: true

  # encrypt_password
  before_create :encrypt_password

  def self.login(user)
    password = Digest::SHA1.hexdigest("a#{user[:password]}z")
    User.find_by(email: user[:email], password: password)
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end
end
