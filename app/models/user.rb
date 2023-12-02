class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :memories
  has_many :bucket_lists
  has_many :achievements

  def generate_authentication_token
    token = SecureRandom.hex
    update(authentication_token: token)
    token
  end

  def authentication_token=(token)
    self[:authentication_token] = token
  end
end
