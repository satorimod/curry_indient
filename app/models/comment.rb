class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gourmet, dependent: :destroy

  validates :text, presence: true
end
