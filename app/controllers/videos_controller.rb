class VideosController < ApplicationController

  def index
    query = "SELECT * FROM videos ORDER BY id DESC"
    @videos = Video.find_by_sql(query)
  end

  def new
    @video = VideosTag.new
  end

  def create
    @video = VideosTag.new(video_params)
    # binding.pry
    if @video.valid?
      @video.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where( ['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json: { keyword: tag }
  end

  def show
    @video = Video.find(params[:id])
  end
  
  def edit
    # @video = Video.find(params[:id])
    @video = VideosTag.find
  end

  def update
    video = VideosTag.new.update(video_params)
  end

  private

  def video_params
    params.require(:videos_tag).permit(:title, :introduction, :video, :image, :position_id, :tag_name)
  end

end
