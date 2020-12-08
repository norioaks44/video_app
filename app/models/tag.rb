class Tag < ApplicationRecord

  has_many :video_tag_relations, dependent: :destroy
  has_many :videos, through: :video_tag_relations
  
  validates :tag_name, presence: true, uniqueness: true
end
