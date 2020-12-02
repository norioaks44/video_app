class Video < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position

  has_one_attached :video
  has_one_attached :image

  
  has_many :video_tag_relations
  has_many :tags, through: :video_tag_relations

end
