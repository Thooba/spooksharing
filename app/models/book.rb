class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reservations

  include PgSearch::Model
  pg_search_scope :search_by_title_and_author_and_genre,
    against: [ :title, :author, :genre ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
