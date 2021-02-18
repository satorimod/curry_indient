class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to gourmet_path(@comment.gourmet)
    else
      @gourmet = @comment.gourmet
      @comments = @gourmet.comments
      render 'gourmets/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, gourmet_id: params[:gourmet_id])
  end
end
