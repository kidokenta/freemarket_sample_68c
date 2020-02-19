class LikesController < ApplicationController
  def create
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    like = current_user.likes.build(item_id: params[:item_id])
    like.save 
    redirect_back(fallback_location: item_path(params[:item_id]))
  end

  def destroy
    like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: item_path(params[:item_id]))
  end
end
