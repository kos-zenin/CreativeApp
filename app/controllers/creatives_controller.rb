class CreativesController < ApplicationController
  before_action :set_creative, :only => [:show, :edit, :update, :destroy, :reorder, :read, :mistake]
  before_filter :authenticate_user!, :except => [:show, :index, :mistake]

  def index
    search_string = search_params[:search]
    if search_string.present?
      results = ThinkingSphinx.search "*#{search_string}*", :classes => [Creative,Chapter,Tag], :match_mode => :any
      @creatives = results.map {|result| result.parent}
      @creatives.flatten!
      @creatives.uniq!
      @creatives.compact!
      @title = @creatives.empty? ? (t('.search_title_not_found') + search_string) : t('.search_title')
    else
      @creatives = Creative.all
      @title = t(".all_creatives")
    end
  end

  # GET /creatives/1
  # GET /creatives/1.json
  def show
    @chapters = @creative.chapters.order(number: :asc)
    check_for_mistakes
  end

  # GET /creatives/new
  def new
    @creative = Creative.new
  end

  # GET /creatives/1/edit
  def edit
  end

  def mistake
    @creative.mistakes.create(mistake_params)
  end

  # POST /creatives
  # POST /creatives.json
  def create
    @creative = current_user.creatives.new(creative_params)

    respond_to do |format|
      if @creative.save
        format.html { redirect_to @creative, notice: t('.created_notice') }
        format.json { render action: 'show', status: :created, location: @creative }
      else
        format.html { render action: 'new' }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end
  def read
    @chapters = @creative.chapters.order(number: :asc)
  end

  def reorder
    chapter_ids = params[:sorted].split(',')
    chapter_ids.each_with_index do |chapter_id, i|
      chapter = Chapter.find(chapter_id)
      chapter.update_attribute(:number, i)
    end
    render :nothing => true
  end

  # PATCH/PUT /creatives/1
  # PATCH/PUT /creatives/1.json
  def update
    respond_to do |format|
      if @creative.update(creative_params)
        format.html { redirect_to @creative, notice: t('.updated_notice') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creatives/1
  # DELETE /creatives/1.json
  def destroy
    @creative.destroy
    respond_to do |format|
      format.html { redirect_to creatives_url }
      format.json { head :no_content }
    end
  end

  private

    def check_for_mistakes
      @creative.mistakes.each do |mistake|
        @creative.chapters.each do |chapter|
          mistake.destroy if !chapter.body.include?(mistake.mistake_text)
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_creative
      @creative = Creative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creative_params
      params.require(:creative).permit(:name, :description, :user_id, :tag_tokens)
    end

    def mistake_params
      params.permit(:mistake_text)
    end

    def search_params
      params.permit(:search)
    end
end
