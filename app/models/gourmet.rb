class Gourmet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_one_attached :image
  belongs_to :genre
  belongs_to :area

  def self.search(search)
    if search != ""
      Gourmet.where('text LIKE(?)', "%#{search}%")
    else
      Gourmet.all
    end
  end

  with_options presence: true do
    validates :name
    validates :menu
    validates :feature
    validates :content
    validates :image

    with_options numericality: { other_than: 0 } do
      validates :genre_id
      validates :area_id
    end
  end
end
