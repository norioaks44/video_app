class Video < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position

  has_one_attached :video
  has_one_attached :image

  has_many :video_tag_relations, dependent: :destroy
  has_many :tags, through: :video_tag_relations

  with_options presence: true do
    validates :title
    validates :introduction
    validates :position_id, numericality: { other_than: 1 } 
  end

  validates :video, file_content_type: {allow: [
    'video/mp4',
    'video/mov',
    'video/quicktime']}

  validates :image, file_content_type: { allow: [
    'image/jpeg', 
    'image/jpg', 
    'image/png', 
    'image/bmp', 
    'image/gif'
    ]}

end
