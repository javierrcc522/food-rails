class Review < ActiveRecord::Base
  belongs_to :product, optional: true
  
  validates :author, :presence => true
  validates :content_body, :presence => true
  validates :rating, :presence => true
end
