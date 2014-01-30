class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @creative = Creative.find(params[:creative_id])
    @pictures = @creative.pictures.all
    @picture = Picture.new

    respond_to do |format|
      format.html
      format.json { render json: @pictures.map{|pic| pic.to_jq_download } }
    end
  end
  def create
    creative = Creative.find(params[:creative_id])
    @picture = creative.pictures.new(picture_params)
    respond_to do |format|
      if @picture.save
        format.html {
          render :json => [@picture.to_jq_download].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@picture.to_jq_download]}, status: :created, location: creative_picture_path(creative, @picture) }
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to creative_pictures_url }
      format.json { head :no_content }
    end
  end
  def edit
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end
    def picture_params
        params.require(:picture).permit(:file)
    end
end