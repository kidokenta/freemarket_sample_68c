class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
    @items = @user.items
    @like_items = @user.like_items
  end
end
