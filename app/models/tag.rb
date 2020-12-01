class Tag < ApplicationRecord

  has_many :video_tag_relations
  has_many :videos, through: :video_tag_relations
  
  validates :name, uniqueness: true
end
