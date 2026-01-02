class User < ApplicationRecord
  has_secure_password
  before_create :generate_token
  has_many :sessions, dependent: :destroy

  def generate_token
    self.auth_token = SecureRandom.hex(32)
  end

  def regenerate_token!
    update!(auth_token: SecureRandom.hex(32))
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
