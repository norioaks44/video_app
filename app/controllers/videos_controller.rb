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
    tag = Tag.where( ['name LIKE ?', "%#{params[:keyword]}%"] )
    render json: { keyword: tag }
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def video_params
    params.require(:videos_tag).permit(:title, :introduction, :video, :name, :image, :position_id)
  end

end
