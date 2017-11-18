class Product < ActiveRecord::Base
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country_origin, :presence => true

  has_many :reviews

  scope :ordered_by_name, -> { order(name: :asc) }

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
end
