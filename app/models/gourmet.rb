class Gourmet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :feature
    validates :content
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :genre_id
      validates :area_id
    end
  end
end
