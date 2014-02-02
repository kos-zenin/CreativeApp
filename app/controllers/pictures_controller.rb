require 'RMagick'
include Magick
class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy, :crop, :retouch]

  # GET /pictures
  # GET /pictures.json
  def index
    @creative = Creative.find(params[:creative_id])
    @pictures = @creative.pictures.load
    @picture = Picture.new

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @pictures }
      format.json { render json: @pictures.map{|pic| pic.to_jq_download } }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    #binding.pry
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
  def crop
    par = picture_params_without_picture
    target = Dir.pwd+"/public"+@picture.cropped_url
    target_thumb = Dir.pwd+"/public"+@picture.thumb_cropped_url
    if par[:original] == "true"
      source = Dir.pwd+"/public"+@picture.file.url
      @picture.update_attribute(:cropped, true)
    else
      source = target
    end
    image = Image.read(source).first
    new_image = image.crop!(par[:x].to_i,par[:y].to_i,par[:w].to_i,par[:h].to_i)
    new_image.write(target)

    thumb = Image.read(target).first.resize_to_fill 200, 150
    thumb.write(target_thumb)
  end

  def retouch
    target = Dir.pwd+"/public"+@picture.cropped_url
    target_thumb = Dir.pwd+"/public"+@picture.thumb_cropped_url
    blob = picture_params_without_picture[:image]['data:image/png;base64,'.length .. -1]
    img = Base64.decode64(blob)
    File.open(target, 'wb') { |f| f.write(img) }
    @picture.update_attribute(:cropped, true)

    #RMagick
    image = Image.read(target).first
    thumb = image.resize_to_fill 200, 150
    thumb.write(target_thumb)
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to creative_pictures_path(@picture.creative), notice: 'Picture was successfully updated.' }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to creative_pictures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      #binding.pry
      params.require(:picture).permit(:file, :tag_tokens, :x, :y, :w, :h)
    end

    def picture_params_without_picture
      #binding.pry
      params.permit(:id, :creative_id, :file, :tag_tokens, :x, :y, :w, :h,:original, :image)
    end
end
