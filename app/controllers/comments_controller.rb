class CommentsController < ApplicationController
  def create
   if Comment.create(comment_params)
      redirect_to prototype_path(params[:prototype_id])
   else
    render root_path
   end
  end
  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id],user_id:current_user.id)
  end
end