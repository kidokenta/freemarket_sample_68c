class AdressesController < ApplicationController

  def new
    @adress = Adress.new
  end

  def create
  end

  

  private
  def adress_params
    params.require(:adress).permit(:postal_code,:town,:number,:name).merge(user_id: current_user.id)
  end
end
