class VideosController < ApplicationController

  def index
    query = "SELECT * FROM videos ORDER BY id DESC"
    @videos = Video.find_by_sql(query)
  end

  def new
    @video = VideoTag.new
  end

  def create
    @video = VideoTag.new(video_params)
    if @video.valid?
      @video.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def video_params
    params.require(:videos_tag).permit(:title, :introduction, :video, :name)
  end
end
