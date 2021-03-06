class VideosTag
  include ActiveModel::Model
  attr_accessor :title, :introduction, :video, :name, :image, :position_id
  
  with_options presence: true do
    validates :title
    validates :introduction
    validates :name
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

  def save
    @video = Video.create(title: title, introduction: introduction, video: video, image: image, position_id: position_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    VideoTagRelation.create(video_id: @video.id, tag_id: tag.id)
  end

end