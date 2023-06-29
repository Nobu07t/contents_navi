class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to spot_path(@comment.spot)

    else
      @spot = Spot.find(@comment.spot_id)
      @comments = @spot.comments
      render "spots/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
