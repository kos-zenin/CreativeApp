class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    @comment.creative_id = params[:creative_id]
    @comment.save
    respond_to do |format|
      format.html { redirect_to creative_path(@comment.creative) }
      format.js
    end
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


  private
    def comment_params
	    params.require(:comment).permit(:body)
	  end
end
