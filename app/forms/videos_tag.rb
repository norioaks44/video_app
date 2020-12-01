class VideosTag

  include ActiveModel::Model
  attr_accessor :title, :introduction, :video, :name
  
  with_options presence: true do
    validates :title
    validates :introduction
    validates :name
    validates :video, file_content_type: {allow:'video/mp4'}
  end

  def save
    @video = Video.create(title: title, introduction: introduction, video: video)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    VideoTagRelation.create(video_id: @video.id, tag_id: tag.id)
    # @video = Video.create(title: title, introduction: introduction, video: video)
    # @tag = Tag.where(name: name).first_or_initialize
    # @tag.save
    # VideoTagRelation.create(video_id: @video.id, tag_id: @tag.id)
  end

end