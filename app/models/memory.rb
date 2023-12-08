class Memory < ApplicationRecord
  belongs_to :user, optional: true
  #has_one_attached :photo, dependent: :destroy
  validates :date, presence: true
  #attr_accessor :photo
end

