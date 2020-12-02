class Video < ApplicationRecord
  has_one_attached :video
  has_one_attached :image
  # has_many_attached :videos

  
  has_many :video_tag_relations
  has_many :tags, through: :video_tag_relations

end
