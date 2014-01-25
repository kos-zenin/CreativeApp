class CommentsController < ApplicationController
  def create
    creative = Creative.find(params[:creative_id])
    comment = creative.comments.create_by_user(comment_params, current_user)
    render :json => comment
  end

  def show
    creative = Creative.find(params[:creative_id])
    comments = creative.comments
    render :json => comments
  end
 def destroy
     @comment = Comment.find(params[:id])
     creative_id = @comment.creative_id
     @comment.destroy
     respond_to do |format|
       format.html { redirect_to creative_path(creative_id) }
       format.js
     end
   end

  def default_serializer_options
    {root: false}
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
