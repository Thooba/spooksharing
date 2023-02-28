class Reservation < ApplicationRecord
  belongs_to :books
  belongs_to :user
end
