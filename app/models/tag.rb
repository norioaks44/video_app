class Tag < ApplicationRecord

  has_many :video_tag_relations
  has_many :videos, through: :video_tag_relations
  
  validates :tag_name, uniqueness: true
end
