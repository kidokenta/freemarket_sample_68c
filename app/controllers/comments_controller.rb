class CommentsController < ApplicationController

def new
  @comment = Comment.new(comment_params)
end

def create
  @comment = Comment.create(comment_params)
  if @comment.save
    respond_to do |format|
      format.html { redirect_to items_path(params[:item_id])}
      format.json
    end
  else
    flash.now[:alert] = 'メッセージを入力してください。'
    redirect_to items_path(params[:item_id])
  end
end

private
def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
end
end