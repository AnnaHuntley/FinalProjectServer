class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :memories
  has_many :bucket_lists
  has_many :achievements
end