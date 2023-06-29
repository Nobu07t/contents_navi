class Spot < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :city, presence: true

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :genre_id, numericality: {other_than: 1, message: "can't be blank"}
  
end
