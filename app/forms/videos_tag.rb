class VidoesTag

  include ActiveModel::Model
  attr_accessor :title, :introduction, :video, :name
  
  with_options presence: true do
    validates :title
    validates :introduction
    validates :name
  end

  def save
    video = Video.create(title: title, introduction: introduction, video: video)
    tag = Tag.create(name: name)
    VideoTagRelation.create(video_id: video.id, tag_id: tag.id)
  end

end