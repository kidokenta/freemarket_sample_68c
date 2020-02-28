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


# def create
#   @message = @group.messages.new(message_params)
#   if @message.save
#     respond_to do |format|
#       format.json
#     end
#   else
#     @messages = @group.messages.includes(:user)
#     flash.now[:alert] = 'メッセージを入力してください。'
#     render :index
#   end
# end



private
def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
end



end