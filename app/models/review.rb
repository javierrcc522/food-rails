class Review < ActiveRecord::Base
  belongs_to :product, optional: true
  validates :author, :presence => true
  validates_inclusion_of :rating, :in => 1..5
  validates_length_of :content_body, :maximum => 250
  validates_length_of :content_body, :minimum => 50
end
