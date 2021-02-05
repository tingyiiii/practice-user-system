class User < ApplicationRecord
  # validations
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, presence: true, confirmation: true
  validates :nickname, presence: true

  # encrypt_password
  before_create :encrypt_password

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end
end
