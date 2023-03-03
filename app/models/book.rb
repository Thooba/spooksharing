class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reservations, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_title_and_author_and_genre,
    against: [ :title, :author, :genre ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def image_creator(genre)
    case genre
    when "horror"
      return "skull.png"
    when "love"
      return "love.png"
    when "comedy"
      return "comedy.png"
    when "super natural"
      return "supernatural.png"
    else
      return "alien.png"
    end
  end
end
