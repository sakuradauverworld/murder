class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reviews
  belongs_to :user
  validates :name, {presence: true}
end
