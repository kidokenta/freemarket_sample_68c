class OrdersController < ApplicationController
  def new
    @card = Card.find_by(user_id: current_user.id)
  end
end
