class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B'
  }
  has_one_attached :photo
  belongs_to :category
  
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
