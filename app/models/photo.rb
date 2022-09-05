class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_one_attached :photo

  validates :photo, presence: true
end
