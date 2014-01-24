class CommentsController < ApplicationController
	 def create
    creative = creative.find(params[:creative_id])
    comment = creative.comments.create_by_user(params[:comment], current_user)
    respond_to do |format|
        format.json { render json: comment }
    end
  end

  def show
    creative = creative.find(params[:post_id])
    comments = creative.comments
    respond_to do |format|
        format.json { render json: comments }
    end
  end
end
