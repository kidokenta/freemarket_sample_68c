class UsersController < ApplicationController
  def show
    @user = current_user
    @items = @user.items
    @like_items = @user.like_items
  end

  def index
  end
end
