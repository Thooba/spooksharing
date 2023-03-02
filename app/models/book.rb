class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
