class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password
  before_create :generate_api_key

private

  def generate_api_key
    self.api_key = SecureRandom.hex(13)
  end

end
