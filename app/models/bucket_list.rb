class BucketList < ApplicationRecord
  belongs_to :user, optional: true
  validates :item, presence: true
end

