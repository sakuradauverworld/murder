class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  # has_many :reviews
end
