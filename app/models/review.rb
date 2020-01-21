class Review < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :review, {presence: true}
  

end
