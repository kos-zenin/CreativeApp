class ChaptersController < ApplicationController
  before_action :set_creative_chapter, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @chapters = Chapter.all
  end
  def show
  end
  def new
    @chapter = Chapter.new
    @chapter.creative_id = params[:creative_id]
  end
  def edit
  end
  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.number = @chapter.creative.chapters.count + 1;

      if @chapter.save
        redirect_to @chapter.creative, notice: 'Chapter successfully created'
      else
        render action 'new'
      end
  end
  def update
      if @chapter.update(chapter_params)
        redirect_to @chapter.creative, notice: 'Chapter successfully updated'
      else
        render action: 'update'
      end
    end
  def destroy
    creative_id = @chapter.creative_id
    @chapter.destroy
    redirect_to creative_path(creative_id) 
  end

  private
    def set_creative_chapter
      @chapter = Chapter.find(params[:id])
    end
    def chapter_params
      params.require(:chapter).permit(:name, :number, :body, :creative_id)
    end
end
