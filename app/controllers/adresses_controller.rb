class AdressesController < ApplicationController

  def new
    @adress = Adress.new
  end

  def create
    @adress = Adress.create(adress_params)
    if @adress.save
      redirect_to root_path
    end
  end

  

  private
  def adress_params
    params.require(:adress).permit(:postal_code,:prefecture,:town,:number,:name).merge(user_id: current_user.id)
  end

end