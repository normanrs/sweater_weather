class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 1}, allow_blank: true
  before_create :generate_api_key

private

  def generate_api_key
    self.api_key = SecureRandom.hex(13)
  end

end
