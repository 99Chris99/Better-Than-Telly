class Review < ApplicationRecord
  belongs_to :event

  validates :title, :content, presence: true
  validates :rating, numericality: { maximum: 5 }
  
  # has_many :event_reviews
  # has_many :events, through: :event_reviews


  def self.rating_range
    range = [5,4,3,2,1]
    return range
  end


end
